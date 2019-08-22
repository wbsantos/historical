namespace Kairos.View
{
    partial class UcProfessor
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
            this.txtRG = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cmbDisciplina = new System.Windows.Forms.ComboBox();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cmbPeriodo = new System.Windows.Forms.ComboBox();
            this.btnDelDisciplina = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.btnAddDisciplina = new System.Windows.Forms.Button();
            this.numValorDisciplina = new System.Windows.Forms.NumericUpDown();
            this.label5 = new System.Windows.Forms.Label();
            this.lbxDisciplinas = new System.Windows.Forms.ListBox();
            this.lbxTurnos = new System.Windows.Forms.ListBox();
            this.cmbProfessor = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.numValorDiaSemana = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.lbxDiaSemana = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnDelProfessor = new System.Windows.Forms.Button();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numValorDisciplina)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numValorDiaSemana)).BeginInit();
            this.SuspendLayout();
            // 
            // txtRG
            // 
            this.txtRG.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.txtRG.Font = new System.Drawing.Font("Calibri", 8.25F);
            this.txtRG.Location = new System.Drawing.Point(36, 191);
            this.txtRG.Name = "txtRG";
            this.txtRG.Size = new System.Drawing.Size(283, 21);
            this.txtRG.TabIndex = 4;
            this.txtRG.Leave += new System.EventHandler(this.txtRG_Leave);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.BackColor = System.Drawing.Color.Transparent;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(33, 175);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(22, 13);
            this.label6.TabIndex = 3;
            this.label6.Text = "RG";
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.Transparent;
            this.groupBox3.Controls.Add(this.label9);
            this.groupBox3.Controls.Add(this.cmbDisciplina);
            this.groupBox3.Controls.Add(this.cmbCurso);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.cmbPeriodo);
            this.groupBox3.Controls.Add(this.btnDelDisciplina);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Controls.Add(this.btnAddDisciplina);
            this.groupBox3.Controls.Add(this.numValorDisciplina);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.lbxDisciplinas);
            this.groupBox3.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox3.ForeColor = System.Drawing.Color.White;
            this.groupBox3.Location = new System.Drawing.Point(377, 135);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(386, 253);
            this.groupBox3.TabIndex = 7;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Preferência Disciplina";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.White;
            this.label9.Location = new System.Drawing.Point(3, 202);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(57, 13);
            this.label9.TabIndex = 5;
            this.label9.Text = "Disciplina";
            // 
            // cmbDisciplina
            // 
            this.cmbDisciplina.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbDisciplina.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbDisciplina.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbDisciplina.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDisciplina.FormattingEnabled = true;
            this.cmbDisciplina.Location = new System.Drawing.Point(6, 218);
            this.cmbDisciplina.Name = "cmbDisciplina";
            this.cmbDisciplina.Size = new System.Drawing.Size(324, 21);
            this.cmbDisciplina.TabIndex = 6;
            // 
            // cmbCurso
            // 
            this.cmbCurso.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbCurso.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbCurso.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(6, 175);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(170, 21);
            this.cmbCurso.TabIndex = 2;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.White;
            this.label7.Location = new System.Drawing.Point(179, 159);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(47, 13);
            this.label7.TabIndex = 3;
            this.label7.Text = "Período";
            // 
            // cmbPeriodo
            // 
            this.cmbPeriodo.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbPeriodo.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbPeriodo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPeriodo.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbPeriodo.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPeriodo.FormattingEnabled = true;
            this.cmbPeriodo.Location = new System.Drawing.Point(182, 175);
            this.cmbPeriodo.Name = "cmbPeriodo";
            this.cmbPeriodo.Size = new System.Drawing.Size(148, 21);
            this.cmbPeriodo.TabIndex = 4;
            this.cmbPeriodo.SelectedIndexChanged += new System.EventHandler(this.cmbPeriodo_SelectedIndexChanged);
            // 
            // btnDelDisciplina
            // 
            this.btnDelDisciplina.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelDisciplina.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelDisciplina.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelDisciplina.ForeColor = System.Drawing.Color.Black;
            this.btnDelDisciplina.Location = new System.Drawing.Point(336, 16);
            this.btnDelDisciplina.Name = "btnDelDisciplina";
            this.btnDelDisciplina.Size = new System.Drawing.Size(33, 22);
            this.btnDelDisciplina.TabIndex = 8;
            this.btnDelDisciplina.Text = "-";
            this.btnDelDisciplina.UseVisualStyleBackColor = false;
            this.btnDelDisciplina.Click += new System.EventHandler(this.btnDelDisciplina_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.White;
            this.label8.Location = new System.Drawing.Point(3, 158);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(37, 13);
            this.label8.TabIndex = 1;
            this.label8.Text = "Curso";
            // 
            // btnAddDisciplina
            // 
            this.btnAddDisciplina.BackColor = System.Drawing.SystemColors.Window;
            this.btnAddDisciplina.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAddDisciplina.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnAddDisciplina.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddDisciplina.ForeColor = System.Drawing.Color.Black;
            this.btnAddDisciplina.Location = new System.Drawing.Point(336, 218);
            this.btnAddDisciplina.Name = "btnAddDisciplina";
            this.btnAddDisciplina.Size = new System.Drawing.Size(33, 22);
            this.btnAddDisciplina.TabIndex = 7;
            this.btnAddDisciplina.Text = "+";
            this.btnAddDisciplina.UseVisualStyleBackColor = false;
            this.btnAddDisciplina.Click += new System.EventHandler(this.btnAddDisciplina_Click);
            // 
            // numValorDisciplina
            // 
            this.numValorDisciplina.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numValorDisciplina.Location = new System.Drawing.Point(336, 69);
            this.numValorDisciplina.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numValorDisciplina.Name = "numValorDisciplina";
            this.numValorDisciplina.Size = new System.Drawing.Size(44, 21);
            this.numValorDisciplina.TabIndex = 10;
            this.numValorDisciplina.Click += new System.EventHandler(this.numValorDisciplina_Click);
            this.numValorDisciplina.KeyUp += new System.Windows.Forms.KeyEventHandler(this.numValorDisciplina_KeyUp);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.Transparent;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(333, 53);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(34, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "Valor";
            // 
            // lbxDisciplinas
            // 
            this.lbxDisciplinas.BackColor = System.Drawing.Color.White;
            this.lbxDisciplinas.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxDisciplinas.FormattingEnabled = true;
            this.lbxDisciplinas.Location = new System.Drawing.Point(6, 16);
            this.lbxDisciplinas.Name = "lbxDisciplinas";
            this.lbxDisciplinas.Size = new System.Drawing.Size(324, 121);
            this.lbxDisciplinas.TabIndex = 0;
            this.lbxDisciplinas.SelectedIndexChanged += new System.EventHandler(this.lbxDisciplinas_SelectedIndexChanged);
            // 
            // lbxTurnos
            // 
            this.lbxTurnos.BackColor = System.Drawing.Color.White;
            this.lbxTurnos.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxTurnos.FormattingEnabled = true;
            this.lbxTurnos.Location = new System.Drawing.Point(132, 16);
            this.lbxTurnos.Name = "lbxTurnos";
            this.lbxTurnos.Size = new System.Drawing.Size(120, 108);
            this.lbxTurnos.TabIndex = 0;
            this.lbxTurnos.SelectedIndexChanged += new System.EventHandler(this.lbxDiaSemana_SelectedIndexChanged);
            // 
            // cmbProfessor
            // 
            this.cmbProfessor.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Append;
            this.cmbProfessor.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cmbProfessor.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cmbProfessor.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbProfessor.FormattingEnabled = true;
            this.cmbProfessor.Location = new System.Drawing.Point(36, 151);
            this.cmbProfessor.Name = "cmbProfessor";
            this.cmbProfessor.Size = new System.Drawing.Size(283, 21);
            this.cmbProfessor.TabIndex = 2;
            this.cmbProfessor.SelectedIndexChanged += new System.EventHandler(this.cmbProfessor_SelectedIndexChanged);
            this.cmbProfessor.TextChanged += new System.EventHandler(this.cmbProfessor_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(33, 135);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Professor";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.lbxTurnos);
            this.groupBox1.Controls.Add(this.numValorDiaSemana);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.lbxDiaSemana);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 8.25F);
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(36, 242);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(322, 146);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Preferência Dia da Semana";
            // 
            // numValorDiaSemana
            // 
            this.numValorDiaSemana.Font = new System.Drawing.Font("Calibri", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numValorDiaSemana.Location = new System.Drawing.Point(261, 34);
            this.numValorDiaSemana.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numValorDiaSemana.Name = "numValorDiaSemana";
            this.numValorDiaSemana.Size = new System.Drawing.Size(44, 21);
            this.numValorDiaSemana.TabIndex = 2;
            this.numValorDiaSemana.Click += new System.EventHandler(this.numValorDiaSemana_Click);
            this.numValorDiaSemana.KeyUp += new System.Windows.Forms.KeyEventHandler(this.numValorDiaSemana_KeyUp);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(258, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(34, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Valor";
            // 
            // lbxDiaSemana
            // 
            this.lbxDiaSemana.BackColor = System.Drawing.Color.White;
            this.lbxDiaSemana.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbxDiaSemana.FormattingEnabled = true;
            this.lbxDiaSemana.Location = new System.Drawing.Point(6, 16);
            this.lbxDiaSemana.Name = "lbxDiaSemana";
            this.lbxDiaSemana.Size = new System.Drawing.Size(120, 108);
            this.lbxDiaSemana.TabIndex = 0;
            this.lbxDiaSemana.SelectedIndexChanged += new System.EventHandler(this.lbxDiaSemana_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 78F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(597, 139);
            this.label1.TabIndex = 0;
            this.label1.Text = "Professores";
            // 
            // btnDelProfessor
            // 
            this.btnDelProfessor.BackColor = System.Drawing.SystemColors.Window;
            this.btnDelProfessor.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelProfessor.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnDelProfessor.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelProfessor.ForeColor = System.Drawing.Color.Black;
            this.btnDelProfessor.Location = new System.Drawing.Point(325, 151);
            this.btnDelProfessor.Name = "btnDelProfessor";
            this.btnDelProfessor.Size = new System.Drawing.Size(33, 22);
            this.btnDelProfessor.TabIndex = 5;
            this.btnDelProfessor.Text = "-";
            this.btnDelProfessor.UseVisualStyleBackColor = false;
            this.btnDelProfessor.Click += new System.EventHandler(this.btnDelProfessor_Click);
            // 
            // UcProfessor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(81)))), ((int)(((byte)(51)))), ((int)(((byte)(171)))));
            this.ColorScreen = Kairos.View.Color.Names.DarkPurple;
            this.Controls.Add(this.btnDelProfessor);
            this.Controls.Add(this.txtRG);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.cmbProfessor);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Cursor = System.Windows.Forms.Cursors.Hand;
            this.Name = "UcProfessor";
            this.Size = new System.Drawing.Size(788, 410);
            this.Load += new System.EventHandler(this.UcProfessor_Load);
            this.Enter += new System.EventHandler(this.UcProfessor_Enter);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numValorDisciplina)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numValorDiaSemana)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbProfessor;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListBox lbxDiaSemana;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.NumericUpDown numValorDiaSemana;
        private System.Windows.Forms.ListBox lbxTurnos;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.NumericUpDown numValorDisciplina;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ListBox lbxDisciplinas;
        private System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cmbPeriodo;
        private System.Windows.Forms.Button btnDelDisciplina;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btnAddDisciplina;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtRG;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cmbDisciplina;
        private System.Windows.Forms.Button btnDelProfessor;
    }
}