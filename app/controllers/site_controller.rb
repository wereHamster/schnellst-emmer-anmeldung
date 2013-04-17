class SiteController < ApplicationController

  def index
    if id = cookies["supervisor"]
      @supervisor = Supervisor.find(id)
      @athletes   = @supervisor.athletes
    else
      redirect_to "/signin"
    end
  end

  def signin
    if cookies["supervisor"]
      redirect_to "/"
    else
    end
  end

  def signin_action
    if supervisor = Supervisor.find_by_email(params[:email])
    else
      supervisor = Supervisor.create(params.slice(:email, :name, :school))
    end

    cookies["supervisor"] = supervisor.id
    redirect_to "/"
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

end
