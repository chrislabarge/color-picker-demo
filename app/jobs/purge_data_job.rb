class PurgeDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "Deleting"
    puts "Deleting"

    ColorOption.all.each do |option|
        Rails.logger.info option.inspect
        puts option.inspect
    end

    ColorOption.destroy_all
  end
end
