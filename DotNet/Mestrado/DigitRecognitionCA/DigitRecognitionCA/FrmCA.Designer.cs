namespace DigitRecognitionCA
{
    partial class FrmCA
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
            this.components = new System.ComponentModel.Container();
            this.pnlMatrix = new System.Windows.Forms.Panel();
            this.automaticPlay = new System.Windows.Forms.Timer(this.components);
            this.btnPlay = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.cbxView = new System.Windows.Forms.ComboBox();
            this.btnNextCA = new System.Windows.Forms.Button();
            this.btnPreviousCA = new System.Windows.Forms.Button();
            this.chkPaintLeft = new System.Windows.Forms.CheckBox();
            this.chkPaintBottom = new System.Windows.Forms.CheckBox();
            this.rtxAnswer = new System.Windows.Forms.RichTextBox();
            this.btnProcessAnswer = new System.Windows.Forms.Button();
            this.btnMassiveProcess = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // pnlMatrix
            // 
            this.pnlMatrix.Location = new System.Drawing.Point(12, 45);
            this.pnlMatrix.Name = "pnlMatrix";
            this.pnlMatrix.Size = new System.Drawing.Size(567, 394);
            this.pnlMatrix.TabIndex = 0;
            // 
            // automaticPlay
            // 
            this.automaticPlay.Tick += new System.EventHandler(this.automaticPlay_Tick);
            // 
            // btnPlay
            // 
            this.btnPlay.Location = new System.Drawing.Point(12, 12);
            this.btnPlay.Name = "btnPlay";
            this.btnPlay.Size = new System.Drawing.Size(75, 23);
            this.btnPlay.TabIndex = 1;
            this.btnPlay.Text = "Play";
            this.btnPlay.UseVisualStyleBackColor = true;
            this.btnPlay.Click += new System.EventHandler(this.btnPlay_Click);
            // 
            // btnNext
            // 
            this.btnNext.Location = new System.Drawing.Point(93, 12);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(75, 23);
            this.btnNext.TabIndex = 2;
            this.btnNext.Text = "Next Cycle";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // cbxView
            // 
            this.cbxView.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxView.FormattingEnabled = true;
            this.cbxView.Items.AddRange(new object[] {
            "Original Numbers",
            "Original Numbers + Base 0",
            "Original Numbers + Base 1",
            "Original Numbers + Base 2",
            "Original Numbers + Base 3",
            "Original Numbers + Base 4",
            "Original Numbers + Base 5",
            "Original Numbers + Base 6",
            "Original Numbers + Base 7",
            "Original Numbers + Base 8",
            "Original Numbers + Base 9"});
            this.cbxView.Location = new System.Drawing.Point(174, 12);
            this.cbxView.Name = "cbxView";
            this.cbxView.Size = new System.Drawing.Size(289, 21);
            this.cbxView.TabIndex = 3;
            this.cbxView.SelectedIndexChanged += new System.EventHandler(this.cbxView_SelectedIndexChanged);
            // 
            // btnNextCA
            // 
            this.btnNextCA.Location = new System.Drawing.Point(947, 14);
            this.btnNextCA.Name = "btnNextCA";
            this.btnNextCA.Size = new System.Drawing.Size(75, 23);
            this.btnNextCA.TabIndex = 4;
            this.btnNextCA.Text = "Next CA";
            this.btnNextCA.UseVisualStyleBackColor = true;
            this.btnNextCA.Click += new System.EventHandler(this.btnNextCA_Click);
            // 
            // btnPreviousCA
            // 
            this.btnPreviousCA.Location = new System.Drawing.Point(866, 14);
            this.btnPreviousCA.Name = "btnPreviousCA";
            this.btnPreviousCA.Size = new System.Drawing.Size(75, 23);
            this.btnPreviousCA.TabIndex = 5;
            this.btnPreviousCA.Text = "Previous CA";
            this.btnPreviousCA.UseVisualStyleBackColor = true;
            this.btnPreviousCA.Click += new System.EventHandler(this.btnPreviousCA_Click);
            // 
            // chkPaintLeft
            // 
            this.chkPaintLeft.AutoSize = true;
            this.chkPaintLeft.Checked = true;
            this.chkPaintLeft.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkPaintLeft.Location = new System.Drawing.Point(635, 18);
            this.chkPaintLeft.Name = "chkPaintLeft";
            this.chkPaintLeft.Size = new System.Drawing.Size(102, 17);
            this.chkPaintLeft.TabIndex = 6;
            this.chkPaintLeft.Text = "Paint Left Driver";
            this.chkPaintLeft.UseVisualStyleBackColor = true;
            this.chkPaintLeft.CheckedChanged += new System.EventHandler(this.chkPaintLeft_CheckedChanged);
            // 
            // chkPaintBottom
            // 
            this.chkPaintBottom.AutoSize = true;
            this.chkPaintBottom.Checked = true;
            this.chkPaintBottom.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkPaintBottom.Location = new System.Drawing.Point(743, 18);
            this.chkPaintBottom.Name = "chkPaintBottom";
            this.chkPaintBottom.Size = new System.Drawing.Size(117, 17);
            this.chkPaintBottom.TabIndex = 7;
            this.chkPaintBottom.Text = "Paint Bottom Driver";
            this.chkPaintBottom.UseVisualStyleBackColor = true;
            this.chkPaintBottom.CheckedChanged += new System.EventHandler(this.chkPaintBottom_CheckedChanged);
            // 
            // rtxAnswer
            // 
            this.rtxAnswer.Font = new System.Drawing.Font("Lucida Sans Typewriter", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rtxAnswer.Location = new System.Drawing.Point(606, 45);
            this.rtxAnswer.Name = "rtxAnswer";
            this.rtxAnswer.ReadOnly = true;
            this.rtxAnswer.Size = new System.Drawing.Size(940, 394);
            this.rtxAnswer.TabIndex = 8;
            this.rtxAnswer.Text = "";
            // 
            // btnProcessAnswer
            // 
            this.btnProcessAnswer.Location = new System.Drawing.Point(1265, 16);
            this.btnProcessAnswer.Name = "btnProcessAnswer";
            this.btnProcessAnswer.Size = new System.Drawing.Size(106, 23);
            this.btnProcessAnswer.TabIndex = 9;
            this.btnProcessAnswer.Text = "Process Answer";
            this.btnProcessAnswer.UseVisualStyleBackColor = true;
            this.btnProcessAnswer.Click += new System.EventHandler(this.btnProcessAnswer_Click);
            // 
            // btnMassiveProcess
            // 
            this.btnMassiveProcess.Location = new System.Drawing.Point(1394, 16);
            this.btnMassiveProcess.Name = "btnMassiveProcess";
            this.btnMassiveProcess.Size = new System.Drawing.Size(106, 23);
            this.btnMassiveProcess.TabIndex = 10;
            this.btnMassiveProcess.Text = "Massive Process";
            this.btnMassiveProcess.UseVisualStyleBackColor = true;
            this.btnMassiveProcess.Click += new System.EventHandler(this.btnMassiveProcess_Click);
            // 
            // FrmCA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1558, 648);
            this.Controls.Add(this.btnMassiveProcess);
            this.Controls.Add(this.btnProcessAnswer);
            this.Controls.Add(this.rtxAnswer);
            this.Controls.Add(this.chkPaintBottom);
            this.Controls.Add(this.chkPaintLeft);
            this.Controls.Add(this.btnPreviousCA);
            this.Controls.Add(this.btnNextCA);
            this.Controls.Add(this.cbxView);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnPlay);
            this.Controls.Add(this.pnlMatrix);
            this.Name = "FrmCA";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CA Viewer";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlMatrix;
        private System.Windows.Forms.Timer automaticPlay;
        private System.Windows.Forms.Button btnPlay;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.ComboBox cbxView;
        private System.Windows.Forms.Button btnNextCA;
        private System.Windows.Forms.Button btnPreviousCA;
        private System.Windows.Forms.CheckBox chkPaintLeft;
        private System.Windows.Forms.CheckBox chkPaintBottom;
        private System.Windows.Forms.RichTextBox rtxAnswer;
        private System.Windows.Forms.Button btnProcessAnswer;
        private System.Windows.Forms.Button btnMassiveProcess;
    }
}

