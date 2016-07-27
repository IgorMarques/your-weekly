require 'rails_helper'
require 'rake'

YourWeekly::Application.load_tasks
Rake::Task['webpack:compile'].invoke
