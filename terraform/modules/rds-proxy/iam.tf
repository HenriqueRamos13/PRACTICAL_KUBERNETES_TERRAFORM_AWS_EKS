# resource "aws_kms_key" "my_key" {
#   description = "KMS Key para encriptar secrets do RDS Proxy"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Id      = "key-default-1",
#     Statement = [
#       {
#         Sid    = "Enable IAM User Permissions",
#         Effect = "Allow",
#         Principal = {
#           AWS = "*"
#         },
#         Action   = "kms:*",
#         Resource = "*"
#       },
#       {
#         Sid    = "Allow use of the key by Secrets Manager",
#         Effect = "Allow",
#         Principal = {
#           Service = "secretsmanager.amazonaws.com"
#         },
#         Action = [
#           "kms:Encrypt",
#           "kms:Decrypt",
#           "kms:ReEncrypt*",
#           "kms:GenerateDataKey*",
#           "kms:DescribeKey"
#         ],
#         Resource = "*"
#       }
#     ]
#   })
# }

resource "aws_iam_role" "rds_proxy_role" {
  name = "${var.proxy_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "rds.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "rds_proxy_role_policy" {
  name = "${var.proxy_name}-policy"
  role = aws_iam_role.rds_proxy_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "RdsConnectAccess",
        Effect   = "Allow",
        Action   = "rds-db:connect",
        Resource = "*"
      },
      {
        Sid    = "SecretsManagerAccess",
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        Resource = var.db_secret_arn
      },
      # {
      #   Sid      = "AllowKmsDecrypt",
      #   Effect   = "Allow",
      #   Action   = "kms:Decrypt",
      #   Resource = aws_kms_key.my_key.arn,
      #   Condition = {
      #     StringEquals = {
      #       "kms:ViaService" = "secretsmanager.${var.aws_region}.amazonaws.com"
      #     }
      #   }
      # }
    ]
  })
}
