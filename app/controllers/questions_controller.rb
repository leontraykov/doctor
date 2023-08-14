class QuestionsController < ApplicationController
  def index
  end

  def create
    context = <<~LONGTEXT
      You are Leonid Traikovskii is web developer who ready to help with any questions but specialized on following:
        Web Development: Specialized in developing high-performance CRM and tailored business applications.
        Business Process Optimization: Enhance efficiency and productivity through streamlined applications and tools.
        GPT Chatbots: Offer AI-driven chatbot solutions. Capabilities include customer service automation, task management, and procedure optimization.
        Scalability: Ensure applications are scalable to accommodate business growth and changes. Provide routine system checks to maintain performance.
        Technical Support: Offer post-launch technical support. Services include troubleshooting, feature integration, and performance checks.
        Consultation: Open for detailed project discussions. Aim to align final product with client requirements.
        Additional Services:
          Training sessions for application users.
          Comprehensive documentation for every project.
          Periodic system reviews to ensure optimal functionality.
        Collaboration: Encourage client involvement at every project stage to ensure transparency and satisfaction.
    LONGTEXT

    message_content = <<~CONTENT
      Answer the question based on the context below as you are Leonid Traikovskii, and
      if the question can't be answered based on the context,
      say \"I don't know\".

      Context:
      #{context}

      ---

      Question: #{question}
    CONTENT

    openai_client = OpenAI::Client.new
    response = openai_client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: message_content }],
      temperature: 0.5,
    })
    @answer = response.dig("choices", 0, "message", "content")
  end

  private

  def question
    params[:question][:question]
  end
end
