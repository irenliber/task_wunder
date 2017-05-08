class UserInfoMailer < ApplicationMailer

  def pdf(user)
    @user = user
    attachments["user_#{@user.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'user_info', template: '/admin/users/show.pdf.haml', layout: 'pdf.html.haml')
    )

    address = if Rails.env.development?
                'irr.morgo@gmail.com'
              else
                'development@taskwunder.com'
              end

    mail(to: address, subject: 'User info')
  end

end