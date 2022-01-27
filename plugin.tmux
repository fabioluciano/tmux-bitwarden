#!/usr/bin/env bash

set -euxo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REQUIRED_PACKAGES="bw sk dasel"
REQUIRED_MINIMUM_TMUX_VERSION="3.2"

source "${CURRENT_DIR}/src/utils.sh"
source "${CURRENT_DIR}/src/bitwarden.sh"

main() {
  check_tmux_required_version $REQUIRED_MINIMUM_TMUX_VERSION
  check_required_packages $REQUIRED_PACKAGES
}

main "$@"
