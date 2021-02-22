
resource "aws_iam_user" "iam-user" {
  count = length(var.username)
  name  = element(var.username, count.index)

  tags = {
    Terraformed = "True"
    Env = "Dev"
  }

}


resource "aws_iam_access_key" "iam-access-key" {
  count = length(var.username)
  user  = element(aws_iam_user.iam-user.*.name, count.index)
}


resource "aws_iam_user_policy" "iam-user-policy" {
  count      = length(var.username)
  user       = element(aws_iam_user.iam-user.*.name, count.index)

  policy     = "${file("policy.json")}" 
}


