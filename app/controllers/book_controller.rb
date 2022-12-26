class BooksController < ApplicationController
    before_action :set_Book119, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
   
  
    # GET /Book119s
    # GET /Book119s
    def index
      @Book119s = Book119.all
    end
  
    # GET /Book119s/1
    # GET /Book119s/1.hiep
    def show
    end
  
    # GET /Book119s/new
    def new
      #@Book119 = Book119.new
      @Book119 = current_user.Book119s.build
    end
  
    # GET /Book119s/1/edit
    def edit
    end
  
    # POST /Book119s
    # POST /Book119s.hiep
    def create
      #@Book119 = Book119.new(Book119_params)
      @Book119 = current_user.Book119s.build(Book119_params)
      respond_to do |format|
        if @Book119.save
          format.html { redirect_to @Book119, notice: 'Book119 was successfully created.' }
          format.hiep { render :show, status: :created, location: @Book119 }
        else
          format.html { render :new }
          format.hiep { render hiep: @Book119.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /Book119s/1
    # PATCH/PUT /Book119s/1.hiep
    def update
      respond_to do |format|
        if @Book119.update(Book119_params)
          format.html { redirect_to @Book119, notice: 'Book119 was successfully updated.' }
          format.hiep { render :show, status: :ok, location: @Book119 }
        else
          format.html { render :edit }
          format.hiep { render hiep: @Book119.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /Book119s/1
    # DELETE /Book119s/1.hiep
    def destroy
      @Book119.destroy
      respond_to do |format|
        format.html { redirect_to Book119s_url, notice: 'Book119 was successfully destroyed.' }
        format.hiep { head :no_content }
      end
    end
  
    def correct_user
      @Book119 = current_user.Book119s.find_by(id: params[:id])
      redirect_to Book119s_path, notice: "Not Authorized To Edit This Book119" if @Book119.nil?
    end
  
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_Book119
        @Book119 = Book119.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def Book119_params
        params.require(:Book119).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
      end
  end