# resource "aws_iam_user" "ses_sender" {
#   name          = "ses_sender-${var.env}"
#   force_destroy = true
# }

# resource "aws_iam_policy" "ses_sender_policy" {
#   name        = "ses_sender_policy-${var.env}"
#   description = "Política para envio de e-mails via SES"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = [
#           "ses:SendEmail",
#           "ses:SendRawEmail"
#         ],
#         Effect   = "Allow",
#         Resource = "*"
#       }
#     ]
#   })
# }
