## What is the image for?
The intended purpose of this image is for it to be used as a Jenkins agent. By using the installed features the user is able to create Jenkins pipelines that can run Ruby scripts and applications. An example of using this image as a Jenkins agent via [Kubernetes](https://plugins.jenkins.io/kubernetes/) can be seen below. 

First, an example of configuring the pod template in yaml to create the agent.

```yaml
jenkins:
  clouds:
    - kubernetes:
        name: "kubernetes"
        templates:
          - name: "image-builder-ruby"
            label: "image-builder-ruby"
            nodeUsageMode: NORMAL
            containers:
              - name: "image-ruby"
                image: "ghcr.io/liatrio/image-builder-ruby:${builder_images_version}"
```
And then specifying the agent in the Jenkinsfile for an example step.

```jenkins
stage('Build') {
  agent {
    label "image-builder-ruby"
  }
  steps {
    container('image-ruby') {
      sh "echo 'puts "Hello Ruby"' > hello.rb"
      ruby hello.rb
    }
  }
}
```

## What is installed on this image?
- Version [3.X.Y](https://pkgs.alpinelinux.org/package/edge/main/x86/ruby) of the Ruby programming language

