module "students" {
  source = "../seat"
  ami = "ami-0fce25857d9f86070"
  for_each = var.students
  student_id = each.key
}

