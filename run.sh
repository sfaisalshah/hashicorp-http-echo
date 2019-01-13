#!/bin/bash
vagrant up --provision
vagrant ssh master -c "docker stack deploy --compose-file compose.yml demo"