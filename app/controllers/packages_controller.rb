class PackagesController < ApplicationController
  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
  end

  # GET /packages/1/edit
  def edit
  end

  # Finds the package(s) associated with a BannerID
  def find
    student = Student.find_by(bannerID: params[:bannerID])
    packages = Package.where(student_id: student.id, received: false).all

    render json: { student: student, packages: packages.to_a }
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new({
      student_id: params[:student_id],
      received: false,
      perishable: params[:perishable],
      first_email: Time.now
    })
    @student = Student.find params[:student_id]

    if @package.save
      render json: { msg: "Package created successfully" }
      # TODO: add account and smtp settings so this actually works
      # PackageMailer.with(student: @student).package_arrived_email.deliver_later
    else
      render json: { msg: "Oh no! There was an error" }
    end
  end

  def update
    package = Package.find params[:package_id]
    Package.update params[:package_id], :received => true

    if package.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:perishable, :student_id, :first_email, :second_email)
    end
end
