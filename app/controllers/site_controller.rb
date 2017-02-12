class SiteController < ApplicationController

  def index
    if id = cookies["supervisor"]
      @supervisor = Supervisor.find_by_id(id)
      if @supervisor.nil?
        redirect_to "/signin"
      elsif @supervisor.locked
        redirect_to "/confirmation"
      else
        @athletes = @supervisor.athletes
      end
    else
      redirect_to "/signin"
    end
  end

  def signin
    if cookies["supervisor"] && !Supervisor.find_by_id(cookies["supervisor"]).nil?
      redirect_to "/"
    else
    end
  end

  def signin_action
    if supervisor = Supervisor.find_by_email(params[:email])
    else
      supervisor = Supervisor.new(params.slice(:email, :name, :school))
      unless supervisor.save
        flash["error"] = true
        return redirect_to "/signin"
      end
    end

    cookies["supervisor"] = supervisor.id
    redirect_to "/"
  end

  def logout
    cookies.delete("supervisor")
    redirect_to "/signin"
  end

  def register
    unless id = cookies["supervisor"]
      return redirect_to "/signin"
    end

    supervisor = Supervisor.find(id)

    attrs = params.slice(:sex, :birth_cohort, :last_name, :first_name, :street, :postcode)
    attrs[:supervisor_id] = supervisor.id

    if supervisor.athletes.where(birth_cohort: attrs[:birth_cohort], sex: attrs[:sex]).count >= 3
        flash["too_many_athletes_in_category"] = attrs[:birth_cohort] + "/" + attrs[:sex]
        return redirect_to "/"
    end

    athlete = Athlete.new(attrs)
    if athlete.save
      redirect_to "/"
    else
      flash["athlete_save_error"] = true
      redirect_to "/"
    end
  end

  def deregister
    Athlete.delete(params["athlete"])
    redirect_to "/"
  end

  def export
    render text: Athlete.to_csv, content_type: 'Content-Type: text/csv'
  end

  def finalize
      unless id = cookies["supervisor"]
        return redirect_to "/signin"
      end

      supervisor = Supervisor.find(id)
      supervisor.locked = true
      supervisor.save

      redirect_to '/confirmation'
  end

  def confirmation
      if id = cookies["supervisor"]
        @supervisor = Supervisor.find(id)
        @athletes   = @supervisor.athletes
      else
        redirect_to "/signin"
      end
  end

end
