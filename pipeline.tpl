pipeline:
  name: Demo Pipeline
  identifier: demo_pipeline
  projectIdentifier: ${project_id}
  orgIdentifier: ${org_id}
  tags: {}
  stages:
    - stage:
        name: Demo Stage
        identifier: Demo_Stage
        description: ""
        type: Custom
        spec:
          execution:
            steps:
              - step:
                  type: ShellScript
                  name: Say Hello
                  identifier: Say_Hello
                  spec:
                    shell: Bash
                    onDelegate: true
                    source:
                      type: Inline
                      spec:
                        script: |-
                          echo "Hello World!"
                          echo "Running from Harness"
                    environmentVariables: []
                    outputVariables: []
                  timeout: 10m
        tags: {}
