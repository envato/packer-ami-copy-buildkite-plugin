#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

export ECR_ACCOUNT_ID=0123456789

@test "successfully logs into ECR" {
  run $PWD/hooks/pre-command

  assert_success
}
