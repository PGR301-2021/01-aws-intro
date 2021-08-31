module "students" {
  source = "../seat"
  ami = "ami-07e80d21069d8da7e"
  for_each = var.students
  student_id = each.key
}

