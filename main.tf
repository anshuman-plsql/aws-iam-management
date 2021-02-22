#############################################
# Create multiple IAM Users                 #
#############################################
resource "aws_iam_user" "iam-user" {
  count = length(var.username)
  name  = element(var.username, count.index)

  tags = {
    Terraformed = "True"
    Env = "Dev"
  }

}


#############################################
# Create Access Keys and Secrets for users  #
#############################################
resource "aws_iam_access_key" "iam-access-key" {
  count = length(var.username)
  user  = element(aws_iam_user.iam-user.*.name, count.index)
}


#############################################
# Create policies for users                 #
#############################################
resource "aws_iam_user_policy" "iam-user-policy" {
  count      = length(var.username)
  user       = element(aws_iam_user.iam-user.*.name, count.index)

  policy     = "${file("policy.json")}" 
}


