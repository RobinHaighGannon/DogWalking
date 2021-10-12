# frozen_string_literal: false

Spring.watch(
  '.ruby-version',
  '.rbenv-vars',
  'tmp/restart.txt',
  'tmp/caching-dev.txt'
)
