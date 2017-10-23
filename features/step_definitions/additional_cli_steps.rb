begin
  require "action_cable"
rescue LoadError # rubocop:disable Lint/HandleExceptions
end
require "rails/version"

require "rspec/rails/feature_check"
require "action-cable-testing"

Then /^the example(s)? should( all)? pass$/ do |_, _|
  step %q{the output should contain "0 failures"}
  step %q{the exit status should be 0}
end

Then /^the example(s)? should( all)? fail/ do |_, _|
  step %q{the output should not contain "0 failures"}
  step %q{the exit status should not be 0}
end

Given /action cable is available/ do
  if !RSpec::Rails::FeatureCheck.has_action_cable?
    pending "Action Cable is not available"
  end
end