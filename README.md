# philthegreat
Python FastApi app that returns hostname and timestamp with GET request in / path

# Requirements
1. Python
2. Docker or podman: I used podman and aliased it as docker
3. Requirement packages from python can be checked in app/requirements.txt

# Running the python app without using container
Inside the app folder, run uvicorn main:app --reload which uses port 8000 by default

# Running the python container
In the main root folder:

	1. Build local container image:
	   docker image build -t philthegreat:v1 . -f Dockerfile

	2. Verify image has been built locally:
           docker image ls

	3. Based on the image built locally on step2, run the container:
	   docker container run -d -p 8080:8000 localhost/philthegreat:v1

	4. Verify if container is running:
           docker ps

	5. Verify if your localhost is listening to this port with python as the process:
           ss -putln | grep 8080

        6. If both step4 and step5 looks good, you can curl or use browser to for GET request on / path:
           curl http://127.0.0.1:8080/

# Running the container app simulating kubernetes via Kind:
1. Create new kubernetes cluster simulation:
   ./kind_k8s_simulation/simulate_k8s.sh

2. Deploy the containers under manifests folder:
   kubectl apply -f deployments.yaml # scale down / up and update rollingStrategy for canary or blue/green testing
   kubectl apply -f services.yaml
   kubectl apply -f ingress.yaml
