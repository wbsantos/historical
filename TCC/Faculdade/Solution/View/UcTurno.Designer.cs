namespace Kairos.View
{
    partial class UcTurno
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.lbxHorarios = new System.Windows.Forms.ListBox();
            this.cmbTurno = new System.Windows.Forms.ComboBox();
            this.tmInicial = new System.Windows.Forms.DateTimePicker();
            this.tmFinal = new System.Windows.Forms.DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btnAddHora = new System.Windows.Forms.Button();
            this.btnDelHora = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnDelTurno = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 78F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(375, 139);
            this.label1.TabIndex = 0;
            this.label1.Text = "Turnos";
            // 
            // lbxHorarios
            // 
            this.lbxHorarios.BackColor = System.Drawing.Color.White;
            this.lbxHorarios.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxHorarios.FormattingEnabled = true;
            this.lbxHorarios.Location = new System.Drawing.Point(6, 16);
            this.lbxHorarios.Name = "lbxHorarios";
            this.lbxHorarios.Size = new System.Drawing.Size(183, 95);
            this.lbxHorarios.TabIndex = 0;
            // 
            // cmbTurno
            // 
            this.cmbTurno.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbTurno.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbTurno.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTurno.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTurno.FormattingEnabled = true;
            this.cmbTurno.Location = new System.Drawing.Point(52, 158);
            this.cmbTurno.Name = "cmbTurno";
            this.cmbTurno.Size = new System.Drawing.Size(121, 21);
            this.cmbTurno.TabIndex = 2;
            this.cmbTurno.SelectedIndexChanged += new System.EventHandler(this.cmbTurno_SelectedIndexChanged);
            this.cmbTurno.TextChanged += new System.EventHandler(this.cmbTurno_TextChanged);
            // 
            // tmInicial
            // 
            this.tmInicial.CustomFormat = "HH:mm";
            this.tmInicial.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tmInicial.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.tmInicial.Location = new System.Drawing.Point(6, 130);
            this.tmInicial.Name = "tmInicial";
            this.tmInicial.ShowUpDown = true;
            this.tmInicial.Size = new System.Drawing.Size(69, 21);
            this.tmInicial.TabIndex = 2;
            // 
            // tmFinal
            // 
            this.tmFinal.CustomFormat = "HH:mm";
            this.tmFinal.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tmFinal.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.tmFinal.Location = new System.Drawing.Point(81, 130);
            this.tmFinal.Name = "tmFinal";
            this.tmFinal.ShowUpDown = true;
            this.tmFinal.Size = new System.Drawing.Size(69, 21);
            this.tmFinal.TabIndex = 4;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(3, 114);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(35, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Início";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(78, 115);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(48, 13);
            this.label5.TabIndex = 3;
            this.label5.Text = "Término";
            // 
            // btnAddHora
            // 
            this.btnAddHora.BackColor = System.Drawing.SystemColors.Window;
            this.btnAddHora.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAddHora.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnAddHora.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddHora.ForeColor = System.Drawing.Color.Black;
            this.btnAddHora.Location = new System.Drawing.Point(156, 130);
            this.btnAddHora.Name = "btnAddHora";
            this.btnAddHora.Size = new System.Drawing.Size(33, 22);
            this.btnAddHora.TabIndex = 5;
            this.btnAddHora.Text = "+";
            this.btnAddHora.UseVisualStyleBackColor = false;
            this.btnAddHora.Click += new System.EventHandler(this.btnAddHora_Click);
            // 
            // btnDelHora
            // 
            this.btnDelHora.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelHora.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelHora.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelHora.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelHora.ForeColor = System.Drawing.Color.Black;
            this.btnDelHora.Location = new System.Drawing.Point(198, 16);
            this.btnDelHora.Name = "btnDelHora";
            this.btnDelHora.Size = new System.Drawing.Size(33, 22);
            this.btnDelHora.TabIndex = 6;
            this.btnDelHora.Text = "-";
            this.btnDelHora.UseVisualStyleBackColor = false;
            this.btnDelHora.Click += new System.EventHandler(this.btnDelHora_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.btnDelHora);
            this.groupBox1.Controls.Add(this.lbxHorarios);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.btnAddHora);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.tmFinal);
            this.groupBox1.Controls.Add(this.tmInicial);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(219, 142);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(245, 163);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Horários das Aulas";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(49, 142);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Turno";
            // 
            // btnDelTurno
            // 
            this.btnDelTurno.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelTurno.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelTurno.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelTurno.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelTurno.ForeColor = System.Drawing.Color.Black;
            this.btnDelTurno.Location = new System.Drawing.Point(180, 157);
            this.btnDelTurno.Name = "btnDelTurno";
            this.btnDelTurno.Size = new System.Drawing.Size(33, 22);
            this.btnDelTurno.TabIndex = 3;
            this.btnDelTurno.Text = "-";
            this.btnDelTurno.UseVisualStyleBackColor = false;
            this.btnDelTurno.Click += new System.EventHandler(this.btnDelTurno_Click);
            // 
            // UcTurno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(138)))), ((int)(((byte)(0)))));
            this.ColorScreen = Kairos.View.Color.Names.Green;
            this.Controls.Add(this.btnDelTurno);
            this.Controls.Add(this.cmbTurno);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.Name = "UcTurno";
            this.Size = new System.Drawing.Size(467, 323);
            this.Load += new System.EventHandler(this.UcTurno_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox lbxHorarios;
        private System.Windows.Forms.ComboBox cmbTurno;
        private System.Windows.Forms.DateTimePicker tmInicial;
        private System.Windows.Forms.DateTimePicker tmFinal;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnAddHora;
        private System.Windows.Forms.Button btnDelHora;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnDelTurno;
    }
}