namespace Kairos.View
{
    partial class UcCurso
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.txtDescricaoPeriodo = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.numQuantPeriodos = new System.Windows.Forms.NumericUpDown();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tmCarga = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbDisciplina = new System.Windows.Forms.ComboBox();
            this.btnDelDisciplina = new System.Windows.Forms.Button();
            this.lbxDisciplinas = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnAddDisciplina = new System.Windows.Forms.Button();
            this.cmbPeriodo = new System.Windows.Forms.ComboBox();
            this.cmbCursos = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tipLbxDisciplinas = new System.Windows.Forms.ToolTip(this.components);
            this.tipCbxDisciplina = new System.Windows.Forms.ToolTip(this.components);
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cmbTurno = new System.Windows.Forms.ComboBox();
            this.txtTurma = new System.Windows.Forms.TextBox();
            this.btnDelTurma = new System.Windows.Forms.Button();
            this.lbxTurmas = new System.Windows.Forms.ListBox();
            this.label8 = new System.Windows.Forms.Label();
            this.btnAddTurma = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnDelCurso = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.numQuantPeriodos)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtDescricaoPeriodo
            // 
            this.txtDescricaoPeriodo.AutoCompleteCustomSource.AddRange(new string[] {
            "Bimestre",
            "Quadrimestre",
            "Semestre",
            "Ano"});
            this.txtDescricaoPeriodo.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.txtDescricaoPeriodo.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.txtDescricaoPeriodo.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDescricaoPeriodo.Location = new System.Drawing.Point(270, 143);
            this.txtDescricaoPeriodo.Name = "txtDescricaoPeriodo";
            this.txtDescricaoPeriodo.Size = new System.Drawing.Size(137, 21);
            this.txtDescricaoPeriodo.TabIndex = 6;
            this.txtDescricaoPeriodo.Text = "Semestre";
            this.txtDescricaoPeriodo.Leave += new System.EventHandler(this.txtDescricaoPeriodo_Leave);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(267, 127);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(56, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "Descrição";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(217, 127);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(42, 13);
            this.label5.TabIndex = 3;
            this.label5.Text = "Quant.";
            // 
            // numQuantPeriodos
            // 
            this.numQuantPeriodos.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numQuantPeriodos.Location = new System.Drawing.Point(220, 143);
            this.numQuantPeriodos.Name = "numQuantPeriodos";
            this.numQuantPeriodos.Size = new System.Drawing.Size(44, 21);
            this.numQuantPeriodos.TabIndex = 4;
            this.numQuantPeriodos.ValueChanged += new System.EventHandler(this.numQuantPeriodos_ValueChanged);
            this.numQuantPeriodos.KeyUp += new System.Windows.Forms.KeyEventHandler(this.numQuantPeriodos_KeyUp);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.tmCarga);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cmbDisciplina);
            this.groupBox1.Controls.Add(this.btnDelDisciplina);
            this.groupBox1.Controls.Add(this.lbxDisciplinas);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.btnAddDisciplina);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(10, 43);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(277, 166);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Disciplinas";
            // 
            // tmCarga
            // 
            this.tmCarga.CustomFormat = "HH:mm";
            this.tmCarga.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tmCarga.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.tmCarga.Location = new System.Drawing.Point(153, 135);
            this.tmCarga.Name = "tmCarga";
            this.tmCarga.ShowUpDown = true;
            this.tmCarga.Size = new System.Drawing.Size(80, 21);
            this.tmCarga.TabIndex = 5;
            this.tmCarga.Value = new System.DateTime(2013, 10, 13, 1, 0, 0, 0);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(150, 119);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Carga Semanal";
            // 
            // cmbDisciplina
            // 
            this.cmbDisciplina.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cmbDisciplina.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDisciplina.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDisciplina.FormattingEnabled = true;
            this.cmbDisciplina.Location = new System.Drawing.Point(6, 135);
            this.cmbDisciplina.Name = "cmbDisciplina";
            this.cmbDisciplina.Size = new System.Drawing.Size(141, 21);
            this.cmbDisciplina.TabIndex = 3;
            this.cmbDisciplina.TextChanged += new System.EventHandler(this.cmbDisciplina_TextChanged);
            // 
            // btnDelDisciplina
            // 
            this.btnDelDisciplina.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelDisciplina.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelDisciplina.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelDisciplina.ForeColor = System.Drawing.Color.Black;
            this.btnDelDisciplina.Location = new System.Drawing.Point(238, 21);
            this.btnDelDisciplina.Name = "btnDelDisciplina";
            this.btnDelDisciplina.Size = new System.Drawing.Size(33, 22);
            this.btnDelDisciplina.TabIndex = 7;
            this.btnDelDisciplina.Text = "-";
            this.btnDelDisciplina.UseVisualStyleBackColor = false;
            this.btnDelDisciplina.Click += new System.EventHandler(this.btnDelDisciplina_Click);
            // 
            // lbxDisciplinas
            // 
            this.lbxDisciplinas.BackColor = System.Drawing.Color.White;
            this.lbxDisciplinas.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxDisciplinas.FormattingEnabled = true;
            this.lbxDisciplinas.Location = new System.Drawing.Point(6, 21);
            this.lbxDisciplinas.Name = "lbxDisciplinas";
            this.lbxDisciplinas.Size = new System.Drawing.Size(227, 95);
            this.lbxDisciplinas.TabIndex = 1;
            this.lbxDisciplinas.SelectedIndexChanged += new System.EventHandler(this.lbxDisciplinas_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(3, 119);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(57, 13);
            this.label4.TabIndex = 2;
            this.label4.Text = "Disciplina";
            // 
            // btnAddDisciplina
            // 
            this.btnAddDisciplina.BackColor = System.Drawing.SystemColors.Window;
            this.btnAddDisciplina.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAddDisciplina.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnAddDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddDisciplina.ForeColor = System.Drawing.Color.Black;
            this.btnAddDisciplina.Location = new System.Drawing.Point(238, 135);
            this.btnAddDisciplina.Name = "btnAddDisciplina";
            this.btnAddDisciplina.Size = new System.Drawing.Size(33, 22);
            this.btnAddDisciplina.TabIndex = 6;
            this.btnAddDisciplina.Text = "+";
            this.btnAddDisciplina.UseVisualStyleBackColor = false;
            this.btnAddDisciplina.Click += new System.EventHandler(this.btnAddDisciplina_Click);
            // 
            // cmbPeriodo
            // 
            this.cmbPeriodo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPeriodo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbPeriodo.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPeriodo.FormattingEnabled = true;
            this.cmbPeriodo.Location = new System.Drawing.Point(10, 16);
            this.cmbPeriodo.Name = "cmbPeriodo";
            this.cmbPeriodo.Size = new System.Drawing.Size(277, 21);
            this.cmbPeriodo.TabIndex = 0;
            this.cmbPeriodo.SelectedIndexChanged += new System.EventHandler(this.cmbPeriodo_SelectedIndexChanged);
            // 
            // cmbCursos
            // 
            this.cmbCursos.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest;
            this.cmbCursos.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbCursos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCursos.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCursos.FormattingEnabled = true;
            this.cmbCursos.Location = new System.Drawing.Point(27, 142);
            this.cmbCursos.Name = "cmbCursos";
            this.cmbCursos.Size = new System.Drawing.Size(187, 21);
            this.cmbCursos.TabIndex = 2;
            this.cmbCursos.SelectedIndexChanged += new System.EventHandler(this.cmbCursos_SelectedIndexChanged);
            this.cmbCursos.TextChanged += new System.EventHandler(this.cmbCursos_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(24, 126);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Curso";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 78F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(3, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(376, 139);
            this.label1.TabIndex = 0;
            this.label1.Text = "Cursos";
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.Transparent;
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.cmbTurno);
            this.groupBox2.Controls.Add(this.txtTurma);
            this.groupBox2.Controls.Add(this.btnDelTurma);
            this.groupBox2.Controls.Add(this.lbxTurmas);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.btnAddTurma);
            this.groupBox2.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox2.ForeColor = System.Drawing.Color.White;
            this.groupBox2.Location = new System.Drawing.Point(293, 43);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(233, 166);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Turmas";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.White;
            this.label7.Location = new System.Drawing.Point(84, 119);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(37, 13);
            this.label7.TabIndex = 10;
            this.label7.Text = "Turno";
            // 
            // cmbTurno
            // 
            this.cmbTurno.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbTurno.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbTurno.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTurno.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbTurno.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTurno.FormattingEnabled = true;
            this.cmbTurno.Location = new System.Drawing.Point(87, 135);
            this.cmbTurno.Name = "cmbTurno";
            this.cmbTurno.Size = new System.Drawing.Size(95, 21);
            this.cmbTurno.TabIndex = 9;
            // 
            // txtTurma
            // 
            this.txtTurma.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.txtTurma.Font = new System.Drawing.Font("Calibri", 8.25F);
            this.txtTurma.Location = new System.Drawing.Point(6, 135);
            this.txtTurma.Name = "txtTurma";
            this.txtTurma.Size = new System.Drawing.Size(77, 21);
            this.txtTurma.TabIndex = 8;
            // 
            // btnDelTurma
            // 
            this.btnDelTurma.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelTurma.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelTurma.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelTurma.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelTurma.ForeColor = System.Drawing.Color.Black;
            this.btnDelTurma.Location = new System.Drawing.Point(188, 21);
            this.btnDelTurma.Name = "btnDelTurma";
            this.btnDelTurma.Size = new System.Drawing.Size(33, 22);
            this.btnDelTurma.TabIndex = 7;
            this.btnDelTurma.Text = "-";
            this.btnDelTurma.UseVisualStyleBackColor = false;
            this.btnDelTurma.Click += new System.EventHandler(this.btnDelTurma_Click);
            // 
            // lbxTurmas
            // 
            this.lbxTurmas.BackColor = System.Drawing.Color.White;
            this.lbxTurmas.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxTurmas.FormattingEnabled = true;
            this.lbxTurmas.Location = new System.Drawing.Point(6, 21);
            this.lbxTurmas.Name = "lbxTurmas";
            this.lbxTurmas.Size = new System.Drawing.Size(176, 95);
            this.lbxTurmas.TabIndex = 1;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.White;
            this.label8.Location = new System.Drawing.Point(3, 119);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(38, 13);
            this.label8.TabIndex = 2;
            this.label8.Text = "Turma";
            // 
            // btnAddTurma
            // 
            this.btnAddTurma.BackColor = System.Drawing.SystemColors.Window;
            this.btnAddTurma.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAddTurma.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnAddTurma.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddTurma.ForeColor = System.Drawing.Color.Black;
            this.btnAddTurma.Location = new System.Drawing.Point(188, 135);
            this.btnAddTurma.Name = "btnAddTurma";
            this.btnAddTurma.Size = new System.Drawing.Size(33, 22);
            this.btnAddTurma.TabIndex = 6;
            this.btnAddTurma.Text = "+";
            this.btnAddTurma.UseVisualStyleBackColor = false;
            this.btnAddTurma.Click += new System.EventHandler(this.btnAddTurma_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.Transparent;
            this.groupBox3.Controls.Add(this.groupBox1);
            this.groupBox3.Controls.Add(this.groupBox2);
            this.groupBox3.Controls.Add(this.cmbPeriodo);
            this.groupBox3.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox3.ForeColor = System.Drawing.Color.White;
            this.groupBox3.Location = new System.Drawing.Point(27, 186);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(540, 222);
            this.groupBox3.TabIndex = 8;
            this.groupBox3.TabStop = false;
            // 
            // btnDelCurso
            // 
            this.btnDelCurso.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelCurso.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelCurso.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelCurso.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelCurso.ForeColor = System.Drawing.Color.Black;
            this.btnDelCurso.Location = new System.Drawing.Point(413, 142);
            this.btnDelCurso.Name = "btnDelCurso";
            this.btnDelCurso.Size = new System.Drawing.Size(33, 22);
            this.btnDelCurso.TabIndex = 7;
            this.btnDelCurso.Text = "-";
            this.btnDelCurso.UseVisualStyleBackColor = false;
            this.btnDelCurso.Click += new System.EventHandler(this.btnDelCurso_Click);
            // 
            // UcCurso
            // 
            this.AccessibleDescription = "";
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ColorScreen = Kairos.View.Color.Names.Red;
            this.Controls.Add(this.btnDelCurso);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.txtDescricaoPeriodo);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.numQuantPeriodos);
            this.Controls.Add(this.cmbCursos);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.Name = "UcCurso";
            this.Size = new System.Drawing.Size(609, 428);
            this.Load += new System.EventHandler(this.UcCurso_Load);
            this.Enter += new System.EventHandler(this.UcCurso_Enter);
            ((System.ComponentModel.ISupportInitialize)(this.numQuantPeriodos)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbCursos;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cmbDisciplina;
        private System.Windows.Forms.Button btnDelDisciplina;
        private System.Windows.Forms.ListBox lbxDisciplinas;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnAddDisciplina;
        private System.Windows.Forms.NumericUpDown numQuantPeriodos;
        private System.Windows.Forms.ComboBox cmbPeriodo;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtDescricaoPeriodo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker tmCarga;
        private System.Windows.Forms.ToolTip tipLbxDisciplinas;
        private System.Windows.Forms.ToolTip tipCbxDisciplina;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtTurma;
        private System.Windows.Forms.Button btnDelTurma;
        private System.Windows.Forms.ListBox lbxTurmas;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btnAddTurma;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cmbTurno;
        private System.Windows.Forms.Button btnDelCurso;
    }
}
