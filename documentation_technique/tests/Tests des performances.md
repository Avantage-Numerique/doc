tag : #documentation_technique 

## Objectifs
Être en mesure de tester l'application et l'API pour des demandes accrus.

## Recherche
https://nextjs.org/docs/pages/building-your-application/optimizing/analytics (semble utilisé : https://web.dev/vitals/)

### Outils
- https://jmeter.apache.org Il ressort souvent. 
- https://gatling.io/open-source/ pricing opensource + entreprise en java.
- [Artillery](https://www.artillery.io/) 
  Intéressant, c'est un package npm, mais qui doit avoir un compte AWS associé. On peut automatiser, mettre dans un CI/CD, etc.
  (turo : https://blog.appsignal.com/2021/11/10/a-guide-to-load-testing-nodejs-apis-with-artillery.html)

## [[Brainstorm]] pour Tests des performances
1. On a besoin d'ajouter du monitoring, pour les tests de stress valent le travail.
2. On a besoin de tester l'API pour le CRUD
3. On a besoin de tester l'API Pour l'accès / connexion
4. On a besoin de tester l'APP Pour l'accès
5. On a besoin de tester l'APP pour le serveur.

Intégration de lighthouse pour avoir des métrics basique. + un load test.
### Métriques qu'on a besoin de monitoré
- **Response time**
  Measure the average response time of your application. This metric indicates how quickly your app can handle requests under stress. An increase in response time can suggest performance degradation.
- **Throughput**
  Track the number of requests processed per unit of time (e.g., requests per second). This metric helps you understand the system's capacity to handle a high load. A decrease in throughput might indicate bottlenecks or resource limitations.
- **Error Rate**
  Monitor the percentage of failed requests or errors generated during the stress test. An uptick in error rate can point to issues such as server overloading, resource exhaustion, or code defects that become apparent under high load.
- **CPU Utilisation**
  Keep an eye on the CPU usage of both your Express.js application and the Nginx server. High CPU utilization might indicate that your system resources are being maxed out, potentially leading to performance degradation and unresponsiveness.
- **Memory Usage**
  Monitor the memory consumption of your application and server. Memory leaks or inefficient memory management can become more pronounced during stress testing. Elevated memory usage could result in slowdowns or crashes.
- L**attency distribution**
  Analyze the distribution of response times (latency) during the stress test. Look for outliers or spikes that could indicate certain requests taking significantly longer than others, leading to a poor user experience.

## [[Conception]] pour Tests des performances


## Structure

```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié
