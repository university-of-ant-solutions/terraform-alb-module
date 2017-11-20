# Terraform alb module

Terraform module which creates ALB within VPC on AWS.

These are the resources which created:

* EC2-VPC Security Group

* ALB

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Usage example

Here's the gist of using it in local:

```
module "alb" {
  source = "./modules/alb"

  vpc_id            = "${var.vpc_id}"
  public_subnets    = "${var.public_subnets}"
  service_name      = "${var.service_name}"
}
```

1. Always `terraform plan` to see your change before running `terraform apply`.

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Naming Conventions

In order to provide consistent developer experience across infrastructure, all names should follow [Naming Conventions](https://github.com/university-of-ant-solutions/naming-conventions)

## Built With

* [Terraform](https://www.terraform.io/) - Write, Plan, and Create Infrastructure as Code

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Hoang Nam** - *Initial work* - [particle4dev](https://github.com/particle4dev)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Reference

* [terraform-aws-security-group](https://github.com/terraform-aws-modules/terraform-aws-security-group)

* [terraform-aws-modules/alb](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/2.1.0)
