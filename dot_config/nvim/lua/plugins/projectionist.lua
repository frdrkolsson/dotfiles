-- Projectionist {{{
vim.cmd([[
autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'src/features/*.ts': {
\      'alternate': [
\        'src/test/features/{}.test.ts',
\        'src/spec/features/{}.spec.ts'
\      ]
\    },
\    'src/hooks/*.ts': {
\      'alternate': [
\        'src/test/hooks/{}.test.ts',
\        'src/spec/hooks/{}.spec.ts'
\      ],
\      'template': [
\        'export const {basename|camelcase} = () => {open}{close};'
\      ]
\    },
\    'src/*.ts': {
\      'alternate': [
\        'src/test/{}.test.ts',
\        'src/spec/{}.spec.ts'
\      ],
\      'template': [
\        'export const {basename|camelcase} = () => {open}{close};'
\      ]
\    },
\    'src/*.test.ts': {
\      'alternate': [
\        'src/{}.test.ts',
\      ],
\      'template': [
\        "it('tests {basename}', () => {open}{close});",
\      ]
\    },
\    'src/features/*.tsx': {
\      'alternate': [
\        'src/test/features/{}.test.tsx',
\        'src/spec/features/{}.spec.tsx'
\      ],
\      'template': [
\        'export const {basename|capitalize|camelcase} = () => {open}',
\        '  return;',
\        '{close};',
\        '',
\        'export default {basename|capitalize|camelcase};'
\      ]
\    },
\    'src/*.tsx': {
\      'alternate': [
\        'src/test/{}.test.tsx',
\        'src/spec/{}.spec.tsx'
\      ],
\      'template': [
\        'export const {basename|capitalize|camelcase} = () => {open}',
\        '  return;',
\        '{close};',
\        '',
\        'export default {basename|capitalize|camelcase};'
\      ]
\    },
\    'src/test/features/*.test.tsx': {
\      'alternate': [
\        'src/features/{}.tsx',
\      ],
\      'template': [
\        "it('tests {basename}', () => {open}{close});",
\      ]
\    },
\    'app/jobs/*_job.rb': {
\      'alternate': [
\        'spec/jobs/{}_spec.rb',
\        'test/jobs/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}Job < ApplicationJob',
\        '  queue_as :default',
\        '',
\        '  def perform(attributes = \{\})',
\        '  end',
\        'end'
\      ]
\    },
\    'app/*.rb': {
\      'alternate': [
\        'spec/{}_spec.rb',
\        'test/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}',
\        'end'
\      ]
\    },
\    'lib/*.rb': {
\      'alternate': [
\        'spec/{}_spec.rb',
\        'test/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}',
\        'end'
\      ]
\    },
\    'spec/*_spec.rb': {
\      'alternate': [
\        'app/{}.rb',
\        'lib/{}.rb'
\      ],
\      'template': [
\        "# frozen_string_literal: true",
\        "",
\        "require 'rails_helper'",
\        "",
\        "RSpec.describe {basename|capitalize|camelcase} do",
\        "end"
\      ]
\    },
\    'test/*_test.rb': {
\      'alternate': 'app/{}.rb',
\      'template': [
\        "# frozen_string_literal: true",
\        "",
\        "require 'test_helper'",
\        "",
\        "class {basename|capitalize|camelcase}Test < ActiveSupport::TestCase",
\        "end"
\      ]
\    },
\    'spec/factories/*.rb': {
\      'alternate': 'spec/{}_spec.rb',
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'FactoryBot.define do',
\        '  factory :{basename|singular} do ',
\        '  end',
\        'end'
\      ]
\    },
\    'test/factories/*.rb': {
\      'alternate': 'test/{}_test.rb',
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'FactoryBot.define do',
\        '  factory :{basename|singular} do ',
\        '  end',
\        'end'
\      ]
\    }
\ })
]])
-- }}}
