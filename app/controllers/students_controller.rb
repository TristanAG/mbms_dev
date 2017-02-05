class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :redirect_check, only: [:index, :show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json

  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student = Student.new({  class_name: session[:class_title],
                              first_name: @student.first_name,
                              last_name: @student.last_name,
                              email: @student.email,
                              phone_number: @student.phone_number,
                              previous_experience: @student.previous_experience,
                              email_list: @student.email_list
                              })

    respond_to do |format|
      if @student.save
        format.html { redirect_to thank_you_path }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(  :class_name,
                                        :first_name,
                                        :last_name,
                                        :email,
                                        :phone_number,
                                        :previous_experience,
                                        :email_list)
    end

    def redirect_check
      if !user_signed_in?
        redirect_to root_path
      end
    end
end
