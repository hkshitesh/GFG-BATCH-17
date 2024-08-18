resource "aws_iam_user" "my-users" {
  count = length(var.iam_user)
  name=var.iam_user[count.index]
  tags = {
    Name="${var.iam_user[count.index]}-user"
  }
}


variable "iam_user" {
  type = list(string)
  default = ["user1","user2","user3"]
}