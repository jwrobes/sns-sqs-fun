require 'aws-sdk-sns'
require 'pry'

# Configure your AWS Sns Client
# Get your personal aws profile by running: `cat ~/.aws/config`
AWS_CREDENTIALS_PROFILE = ''

raise StandardError.new('No Aws Credentials') unless AWS_CREDENTIALS_PROFILE != ''

client = Aws::SNS::Client.new(
  region: 'us-west-2',
  profile: AWS_CREDENTIALS_PROFILE
)

binding.pry

# Get the topic_arn value by logging copying it from the topic in your AWS console
TOPIC_ARN = ''
raise StandardError.new('No Topic Arn Set') unless TOPIC_ARN != ''

test_message = {
  topic_arn: TOPIC_ARN,
  message: "meow",
}

binding.pry

# the following command will publish a message run it for fun!
# response = client.publish(test_message)

puts "you just published some messages"
