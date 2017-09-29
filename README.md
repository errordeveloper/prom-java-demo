# v1: Hello, World!

First, let's take a look at the code
```
cat src/main/java/works/weave/promjavademo/PromJavaDemoApplication.java
```

Our startup is building the best greeting app, we are pre-launching it at
JavaOne in San Francisco today, all Java developers will be talking about it.
We are all set to launch this app and we have picked the best tools. We will
be seeing millions of vistiors. The app is very simple right now, but we will
add more features next week. Right now, we just want to make sure we can run
it on Kuberentes, as it's the way to go, and of course we are buidling it on
Java! We will be deploying dozens of microservices, and will probably add some
AI components to personalise the greetings without knowing up-front who the
user is.

The repo has some config files, like `draft.toml`, some stuff in `chart/` and
most importantly we already have out `Dockerfile` that uses latest features
in Docker – multi-stage builds, which allows us to have a very tiny JRE-only
container that we will deploy.

Let's Deploy it to Kubernetes
```
draft up
```

Wait for external IP address
```
kubectl get svc java-demo --watch
```


While waiting, we have found a handy command to grab the IP
```
kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

Let's check it out
```
curl http://`kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'`/
```

As millions of users will be visiting our app, let's throw some load at it and
make sure it can stand up to it
```
ab -n 300 -c 100 http://`kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'`/
```

That's great! But how are we going to know we provide good service and every user
sees a greeting very quickly?

Checkout next version of the app to find out more...
```
git checkout -q v2-hit-counter
cat README.md
```
