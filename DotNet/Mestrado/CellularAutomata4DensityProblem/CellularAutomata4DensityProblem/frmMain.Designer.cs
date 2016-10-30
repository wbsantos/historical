namespace CellularAutomata4DensityProblem
{
    partial class frmMain
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
            this.btnCreateInitialStates = new System.Windows.Forms.Button();
            this.btnCorrectAnswers = new System.Windows.Forms.Button();
            this.btnProcessCA = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnCreateInitialStates
            // 
            this.btnCreateInitialStates.Location = new System.Drawing.Point(12, 12);
            this.btnCreateInitialStates.Name = "btnCreateInitialStates";
            this.btnCreateInitialStates.Size = new System.Drawing.Size(260, 23);
            this.btnCreateInitialStates.TabIndex = 0;
            this.btnCreateInitialStates.Text = "Create Initial States For Test";
            this.btnCreateInitialStates.UseVisualStyleBackColor = true;
            this.btnCreateInitialStates.Click += new System.EventHandler(this.btnCreateInitialStates_Click);
            // 
            // btnCorrectAnswers
            // 
            this.btnCorrectAnswers.Location = new System.Drawing.Point(12, 41);
            this.btnCorrectAnswers.Name = "btnCorrectAnswers";
            this.btnCorrectAnswers.Size = new System.Drawing.Size(260, 23);
            this.btnCorrectAnswers.TabIndex = 1;
            this.btnCorrectAnswers.Text = "Process Correct Answers";
            this.btnCorrectAnswers.UseVisualStyleBackColor = true;
            this.btnCorrectAnswers.Click += new System.EventHandler(this.btnCorrectAnswers_Click);
            // 
            // btnProcessCA
            // 
            this.btnProcessCA.Location = new System.Drawing.Point(12, 70);
            this.btnProcessCA.Name = "btnProcessCA";
            this.btnProcessCA.Size = new System.Drawing.Size(260, 23);
            this.btnProcessCA.TabIndex = 2;
            this.btnProcessCA.Text = "Process Cellular Automata";
            this.btnProcessCA.UseVisualStyleBackColor = true;
            this.btnProcessCA.Click += new System.EventHandler(this.btnProcessCA_Click);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.btnProcessCA);
            this.Controls.Add(this.btnCorrectAnswers);
            this.Controls.Add(this.btnCreateInitialStates);
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cellular Automata 4 Density";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCreateInitialStates;
        private System.Windows.Forms.Button btnCorrectAnswers;
        private System.Windows.Forms.Button btnProcessCA;
    }
}

