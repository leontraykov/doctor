class QuestionsController < ApplicationController
  def index
  end

  def create
    context = <<~LONGTEXT
      I am a digital assistant equipped to answer questions related to dentistry. With a comprehensive understanding of dental health, I can provide information on:

      Preventive Care: Routine check-ups, dental cleanings, fluoride treatments, and tips for maintaining oral hygiene.
      Restorative Dentistry: Fillings, crowns, bridges, dentures, and root canal treatments.
      Cosmetic Procedures: Teeth whitening, veneers, bonding, and smile makeovers.
      Orthodontics: Braces, clear aligners, and bite correction methods.
      Oral Surgeries: Extractions, wisdom teeth removal, and dental implants.
      Pediatric Dentistry: Children-specific dental concerns, sealants, and mouth guards.
      Gum Health: Information on treating and preventing gingivitis and periodontitis.
      Emergency Dental Issues: Guidance on managing sudden pain, swelling, or trauma to teeth.
      Dental Products: Recommendations for toothbrushes, toothpastes, floss, and mouthwashes.

      Remember, while I can provide general advice and information, I cannot replace a physical consultation with a qualified dentist. For specific concerns or procedures, always consult a dental professional.

      Weekly Schedule:

      Monday: 9:00 AM - 5:00 PM
      Tuesday: 10:00 AM - 6:00 PM
      Wednesday: Closed for surgeries and procedures.
      Thursday: 8:30 AM - 4:30 PM
      Friday: 9:00 AM - 3:00 PM
      Saturday: 10:00 AM - 2:00 PM for emergency appointments only.
      Sunday: Closed
    LONGTEXT

    message_content = <<~CONTENT
      Answer the question based on the context below as you are digital assistant, and
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
