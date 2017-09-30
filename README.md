# v4: Prometheus

First, new version of the code
```
cat src/main/java/works/weave/promjavademo/PromJavaDemoApplication.java
```

So we have actually removed the counter, okay!

We have added Micrometer library, which is the best Java metrics library that we could find on The Internet,
and it support Prometheus and Spring Boot very well!

Let's deploy the new version and see what `/prometheus` endpoint looks like:
```
draft up
```

Check this out!
```
curl http://`kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'`/prometheus
```

Try scaling it up a bit more
```
kubectl scale deployment java-demo --replicas 6
```

Throw even load at it once again
```
ab -n 300 -c 100 http://`kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'`/
```

And have a look at the metrics
```
curl http://`kubectl get svc java-demo -o jsonpath='{.status.loadBalancer.ingress[0].ip}'`/metrics
```

Next, go to Weave Cloud Monitor and find the metrics our app exposes using notebook UI...

---------

Now we are ready to run out awesome greetings app, and do all the fancy AI stuff and all that.

Next, lets's see what it takes to deploy a more sophisticated app to production with Weave Cloud deploy!
