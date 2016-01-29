namespace Kairos.View
{
    partial class FrmMain
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
            this.btnAlterarUsuario = new System.Windows.Forms.Button();
            this.ucGrade1 = new Kairos.View.UcGrade();
            this.ucProfessor1 = new Kairos.View.UcProfessor();
            this.ucTurno1 = new Kairos.View.UcTurno();
            this.ucCurso1 = new Kairos.View.UcCurso();
            this.SuspendLayout();
            // 
            // btnAlterarUsuario
            // 
            this.btnAlterarUsuario.BackColor = System.Drawing.Color.Transparent;
            this.btnAlterarUsuario.BackgroundImage = global::Kairos.Properties.Resources.user;
            this.btnAlterarUsuario.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnAlterarUsuario.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAlterarUsuario.FlatAppearance.BorderColor = System.Drawing.Color.Gray;
            this.btnAlterarUsuario.FlatAppearance.BorderSize = 0;
            this.btnAlterarUsuario.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAlterarUsuario.ForeColor = System.Drawing.Color.Black;
            this.btnAlterarUsuario.Location = new System.Drawing.Point(1623, 12);
            this.btnAlterarUsuario.Name = "btnAlterarUsuario";
            this.btnAlterarUsuario.Size = new System.Drawing.Size(31, 28);
            this.btnAlterarUsuario.TabIndex = 9;
            this.btnAlterarUsuario.UseVisualStyleBackColor = false;
            this.btnAlterarUsuario.Click += new System.EventHandler(this.btnAlterarUsuario_Click);
            // 
            // ucGrade1
            // 
            this.ucGrade1.AccessibleDescription = "";
            this.ucGrade1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(9)))), ((int)(((byte)(74)))), ((int)(((byte)(178)))));
            this.ucGrade1.ColorScreen = Kairos.View.Color.Names.SkyBlue;
            this.ucGrade1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.ucGrade1.Location = new System.Drawing.Point(627, 12);
            this.ucGrade1.Name = "ucGrade1";
            this.ucGrade1.Size = new System.Drawing.Size(990, 428);
            this.ucGrade1.TabIndex = 3;
            // 
            // ucProfessor1
            // 
            this.ucProfessor1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(81)))), ((int)(((byte)(51)))), ((int)(((byte)(171)))));
            this.ucProfessor1.ColorScreen = Kairos.View.Color.Names.DarkPurple;
            this.ucProfessor1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.ucProfessor1.Location = new System.Drawing.Point(521, 446);
            this.ucProfessor1.Name = "ucProfessor1";
            this.ucProfessor1.Size = new System.Drawing.Size(1096, 410);
            this.ucProfessor1.TabIndex = 2;
            // 
            // ucTurno1
            // 
            this.ucTurno1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(138)))), ((int)(((byte)(0)))));
            this.ucTurno1.ColorScreen = Kairos.View.Color.Names.Green;
            this.ucTurno1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.ucTurno1.Location = new System.Drawing.Point(12, 446);
            this.ucTurno1.Name = "ucTurno1";
            this.ucTurno1.Size = new System.Drawing.Size(503, 410);
            this.ucTurno1.TabIndex = 1;
            // 
            // ucCurso1
            // 
            this.ucCurso1.AccessibleDescription = "";
            this.ucCurso1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(172)))), ((int)(((byte)(25)))), ((int)(((byte)(61)))));
            this.ucCurso1.ColorScreen = Kairos.View.Color.Names.Red;
            this.ucCurso1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.ucCurso1.Location = new System.Drawing.Point(12, 12);
            this.ucCurso1.Name = "ucCurso1";
            this.ucCurso1.Size = new System.Drawing.Size(609, 428);
            this.ucCurso1.TabIndex = 0;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(37)))), ((int)(((byte)(114)))), ((int)(((byte)(235)))));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1675, 937);
            this.Controls.Add(this.btnAlterarUsuario);
            this.Controls.Add(this.ucGrade1);
            this.Controls.Add(this.ucProfessor1);
            this.Controls.Add(this.ucTurno1);
            this.Controls.Add(this.ucCurso1);
            this.DoubleBuffered = true;
            this.Name = "FrmMain";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.ResumeLayout(false);

        }

        #endregion

        private UcCurso ucCurso1;
        private UcTurno ucTurno1;
        private UcProfessor ucProfessor1;
        private UcGrade ucGrade1;
        private System.Windows.Forms.Button btnAlterarUsuario;




    }
}