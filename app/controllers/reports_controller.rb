class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create


    require 'csv'

    uploaded_io = params[:report][:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end


    params[:report][:file] = uploaded_io.original_filename

    @report = Report.new(allowed_params)
    if @report.save
      flash[:notice] = 'Información agregada correctamente'


      CSV.foreach( Rails.root.join('public', 'uploads', @report.file) ) do |row|


        data = Record.new

        data.fecha = row[0]


        if row[1] == 'ANSWERED'
          data.estado = 1
        else
          data.estado = 0
        end

        data.report_id = @report.id

        data.save



      end



      redirect_to edit_report_path(@report.id)
    else
      render 'new'
    end


  end

  def edit



    @totalLlamadas = Record.where(:report_id => params[:id])
    @llamadasContestadas = Record.where(:report_id => params[:id], :estado => 1)
    @llamadasNoContestadas = Record.where(:report_id => params[:id], :estado => 0)

    puts @llamadasContestadas


    @report = Report.find(params[:id])
  end


  def update


    @report = Report.find(params[:id])

    if @report.update_attributes(allowed_params)
      flash[:notice] = 'Información actualizada correctamente'
      redirect_to reports_path
    else
      render 'new'
    end

  end


  def pdf
    @totalLlamadas = Record.where(:report_id => params[:id])
    @llamadasContestadas = Record.where(:report_id => params[:id], :estado => 1)
    @llamadasNoContestadas = Record.where(:report_id => params[:id], :estado => 0)

    puts @llamadasContestadas


    @report = Report.find(params[:id])



    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'Reporte '+@report.nombre,
               :orientation => 'Landscape',
               #:disposition                    => 'attachment',
               :font_name          => 'Arial',
               :margin => {:top                => 0,                     # default 10 (mm)
                           :bottom             => 0,
                           :left               => 0,
                           :right              => 0}
      end
    end



  end


  private
  def allowed_params
    params.require(:report).permit!
  end
end
