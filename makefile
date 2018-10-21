# meke sure you use an tab before the commands and not spaces. 
.PHONY: ssh-jenkins ssh-demo-app browse-jenkins graph-svg graph-jpg

ssh-jenkins:
	ssh -i mykey ubuntu@$$(terraform output jenkins-ip)

ssh-demo-app:
	ssh -i mykey centos@$$(terraform output app-ip)

browse-jenkins:
	open http://$$(terraform output jenkins-ip):8080

graph-svg:
	terraform graph | dot -Tsvg > graph.svg

graph-jpg:
	terraform graph | dot -Tjpg > graph.jpg
