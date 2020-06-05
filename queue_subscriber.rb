require 'aws-sdk-sqs'
require 'pry'

# Configure your AWS SNS Client
#
# Get your personal aws profile by running: `cat ~/.aws/config`
AWS_CREDENTIALS_PROFILE = ''

raise StandardError.new('No Aws Credentials') unless AWS_CREDENTIALS_PROFILE != ''

client = Aws::SQS::Client.new(
  region: 'us-west-2',
  profile: AWS_CREDENTIALS_PROFILE
)

# Set the QUEURE URL by copying it from the Queue you created in AWS Console
QUEUE_URL = ''

raise StandardError.new('No Queue Url Set') unless QUEUE_URL != ''

queue_subscriber_request = {
  queue_url: QUEUE_URL, # required
  attribute_names: ["All"], # accepts All, Policy, VisibilityTimeout, MaximumMessageSize, MessageRetentionPeriod, ApproximateNumberOfMessages, ApproximateNumberOfMessagesNotVisible, CreatedTimestamp, LastModifiedTimestamp, QueueArn, ApproximateNumberOfMessagesDelayed, DelaySeconds, ReceiveMessageWaitTimeSeconds, RedrivePolicy, FifoQueue, ContentBasedDeduplication, KmsMasterKeyId, KmsDataKeyReusePeriodSeconds
  max_number_of_messages: 1,
  visibility_timeout: 10,
  wait_time_seconds: 1,
}

binding.pry

response = client.receive_message(queue_subscriber_request)

# Now let's delete the message

# First let's get the recept handle of the first message received
if response.messages.count > 0
  receipt_handle = response.messages.first.receipt_handle#
end

resp = client.delete_message({
  queue_url: QUEUE_URL,
  receipt_handle: receipt_handle, # required
})

# Now if you try to get that message again can you?

response = client.receive_message(queue_subscriber_request)

puts "you just listened and deleted a message of a queue"


