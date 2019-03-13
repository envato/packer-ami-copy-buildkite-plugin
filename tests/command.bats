#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

export PACKER_SECURITY_GROUP_ID='sg-12345'
export PACKER_SUBNET_ID='subnet-54321'
export PACKER_SSH_INTERFACE='private-ip'
export PACKER_IAM_INSTANCE_PROFILE='packer-builder'
export ECR_ACCOUNT_ID=0123456789
export DOCKER_IMAGE=packer-ami-copy

@test "fails when template not found" {
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_TEMPLATE="doesnt/exist.json"

  run $PWD/hooks/command

  assert_failure
}

@test "fails when an invalid command is provided" {
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_TEMPLATE=$PWD/tests/test-template.json
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_COMMANDS_0=validate
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_COMMANDS_1=build
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_COMMANDS_2=whoops

  run $PWD/hooks/command

  assert_failure
}

@test "reaches end (fails with docker not found)" {
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_TEMPLATE=$PWD/tests/test-template.json
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_COMMANDS_0=validate
  export BUILDKITE_PLUGIN_PACKER_AMI_COPY_PACKER_COMMANDS_1=build

  run $PWD/hooks/command

  assert_failure
  assert_output --partial "docker: command not found"
}
