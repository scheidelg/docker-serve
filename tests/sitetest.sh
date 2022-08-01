#!/bin/bash

# Following the course instructions, the 'curl' test would fail because the
# serve container's web service on 3000/tcp wasn't ready by the time this
# script ran inside the sut container.
#
# (also, the port inside the container environment is 3000/tcp, not 5000/tcp,
# but that's a different issue)
#
# The docker-compose.test.yml file does have the correct container dependency
# configuration, but that only checks to make sure the container is up, not
# the service.  So as a quick-and-dirty work-around, I added a 'sleep'
# command here.  In a production environment we'd either want a more complex
# script, or (if possible) a docker-compose.test.yml config that specified a
# dependency on the *service* being ready, not just the container.
sleep 20

if curl http://serve:3000 | grep -Po "<a href=\"&#47;site&#47;.*>site&#47;</a>"; then
    echo -e "Site/ exists!\nContainer test passed."
    exit 0
else
    echo -e "Site/ does not exist.\nContainer test failed."
    exit 1
fi
