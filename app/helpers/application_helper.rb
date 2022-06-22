module ApplicationHelper
  def svg(name)
    File.open("app/assets/images/#{name}.svg", 'rb') do |file|
      raw file.read # rubocop:disable Rails/OutputSafety
    end
  end
end
