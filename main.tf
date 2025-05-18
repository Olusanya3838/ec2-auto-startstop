provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "start_ec2" {
  function_name = "StartEC2Instances"
  role          = aws_iam_role.lambda_ec2_role.arn
  handler       = "lambda_start.lambda_handler"
  runtime       = "python3.12"

  filename         = "${path.module}/lambda_start.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_start.zip")
}
resource "aws_lambda_function" "stop_ec2" {
  function_name = "StopEC2Instances"
  role          = aws_iam_role.lambda_ec2_role.arn
  handler       = "lambda_stop.lambda_handler"
  runtime       = "python3.12"

  filename         = "${path.module}/lambda_stop.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_stop.zip")
}
resource "aws_cloudwatch_event_rule" "start_schedule" {
  name                = "StartEC2Schedule"
  schedule_expression = "cron(0 8 * * ? *)"
}

resource "aws_cloudwatch_event_target" "start_target" {
  rule      = aws_cloudwatch_event_rule.start_schedule.name
  target_id = "StartEC2Instances"
  arn       = aws_lambda_function.start_ec2.arn
}

resource "aws_lambda_permission" "allow_eventbridge_start" {
  statement_id  = "AllowExecutionFromEventBridgeStart"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start_ec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_schedule.arn
}

resource "aws_cloudwatch_event_rule" "stop_schedule" {
  name                = "StopEC2Schedule"
  schedule_expression = "cron(0 17 * * ? *)"
}

resource "aws_cloudwatch_event_target" "stop_target" {
  rule      = aws_cloudwatch_event_rule.stop_schedule.name
  target_id = "StopEC2Instances"
  arn       = aws_lambda_function.stop_ec2.arn
}

resource "aws_lambda_permission" "allow_eventbridge_stop" {
  statement_id  = "AllowExecutionFromEventBridgeStop"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stop_ec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_schedule.arn
}
resource "aws_instance" "auto_start_instance" {
  ami           = "ami-0c02fb55956c7d316" # Use valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name            = "AutoStartInstance"
    AutoStartStop   = "true"
  }
}
