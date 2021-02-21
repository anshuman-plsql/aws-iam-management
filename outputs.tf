output "secret" {
 # count = length(var.username)
   value = aws_iam_access_key.iam-access-key.*.id
  #value = aws_iam_access_key.iam-access-key[count.index]

   #value  = element(var.aws_iam_access_key.iam-access-key.id, count.index)
   #value =  element(aws_iam_user.iam-user.*.name, count.index)
}

output "access_key"{
 # count = length(var.username)
 # value  = element(var.aws_iam_access_key.iam-access-key.secret, count.index)
  value = aws_iam_access_key.iam-access-key.*.secret
}
