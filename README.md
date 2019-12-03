# Packer AMI Copy Buildkite Plugin 

A buildkite plugin to simplify building AMI's with packer

## Usage
```yaml
steps:
  - label: ":packer: New AMI"
    plugins:
      - envato/packer-ami-copy#v0.3:
          packer_commands:
            - validate
            - build
          packer_template: path/to/template.json
          env_vars:
            - "PASS_VAR"
            - "A_DEFAULT=a_value"
          load_artifacts:
            - "build/artifact.zip"
            - "log/file.txt"
          prep_commands:
            - unzip build/artifact.zip
            - cp /dev/null log/file.txt
```

## Configuration

### packer\_commands
Valid packer commands.  Either a single command, or a list of them

### packer\_template
Path within repo to packer template

### chdir
(Optional) Set working directory within repo.  If specified, all paths will be relative to this.

### env\_vars
(Optional) List of additional environment variables available to packer template

### load\_artifacts
(Optional) List of paths to artifacts to load into environment

### prep\_commands
(Optional) List of commands to run against the local repo before executing packer

## License
MIT ([LICENSE](LICENSE))
