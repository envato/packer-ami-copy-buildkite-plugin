# Packer AMI Copy Buildkite Plugin 

A buildkite plugin to simplify building AMI's with packer

## Usage
```yaml
steps:
  - label: ":packer: New AMI"
    plugins:
      - envato/packer-ami-copy#v0.1:
          packer_commands:
            - validate
            - build
          packer_template: path/to/template.json
          env_vars:
            - "PASS_VAR"
            - "A_DEFAULT=a_value"
```

## Configuration

### packer\_commands
Valid packer commands.  Either a single command, or a list of them

### packer\_template
Path within repo to packer template

### env\_vars
List of additional environment variables available to packer template

## License
MIT ([LICENSE](LICENSE))
