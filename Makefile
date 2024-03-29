compliance:
	docker run --rm -v `pwd`:/target -i -t containersol/terraform-compliance:20191003 -f ./scenarios/ -p out.json.plan
plan:
	docker run --rm -ti -v `pwd`:/infra -u `id -u`:`id -g` kbst-infra-automation:bootstrap terraform init
	docker run --rm -ti -v `pwd`:/infra -u `id -u`:`id -g` kbst-infra-automation:bootstrap terraform plan --out=out.plan
	docker run --rm -ti -v `pwd`:/infra -u `id -u`:`id -g` kbst-infra-automation:bootstrap terraform show -json out.plan > out.json.plan
