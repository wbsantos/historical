using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Kairos.View
{
    public partial class UcModel : UserControl
    {
        private Color.Names m_colorScreen { get; set; }
        public Color.Names ColorScreen
        {
            get
            {
                return m_colorScreen;
            }
            set
            {
                m_colorScreen = value;
                PBackColor = Color.getColor(m_colorScreen);
                FrmModel_Enter(null, null);
                if (!this.Focused)
                    FrmModel_Leave(null, null);
            }
        }
        private Color PBackColor { get; set; }

        struct ControlColor
        {
            public Control control;
            public System.Drawing.Color color;
            public System.Drawing.Color foreColor;
        }

        public UcModel()
        {
            InitializeComponent();
        }

        List<ControlColor> controlsColor;
        private void FrmModel_Leave(object sender, EventArgs e)
        {
            if (PBackColor == null)
                return;

            BackColor = PBackColor.Hard;
            controlsColor = new List<ControlColor>();
            gravarColorControls(this);

            Cursor = System.Windows.Forms.Cursors.Hand;
        }

        private void gravarColorControls(Control container)
        {
            foreach (Control item in container.Controls)
            {
                if (item is Label)
                {
                    ControlColor cc;
                    cc.control = item;
                    cc.color = item.BackColor;
                    cc.foreColor = item.ForeColor;
                    controlsColor.Add(cc);

                    item.BackColor = PBackColor.Hard;
                    item.ForeColor = PBackColor.Soft;

                    item.Cursor = System.Windows.Forms.Cursors.Hand;
                }
                else
                    item.Visible = false;
            }
        }

        private void FrmModel_Enter(object sender, EventArgs e)
        {
            if (PBackColor == null)
                return;
            
            BackColor = PBackColor.Soft;
            if (controlsColor == null)
                return;
            recuperarColorControls(this);
            controlsColor = null;

            Cursor = System.Windows.Forms.Cursors.Default;
        }

        private void recuperarColorControls(Control container)
        {
            foreach (Control item in container.Controls)
            {
                if (item is Label)
                {
                    item.Cursor = System.Windows.Forms.Cursors.Default;
                    foreach (ControlColor control in controlsColor)
                    {
                        if (control.control == item)
                        {
                            item.BackColor = control.color;
                            item.ForeColor = control.foreColor;
                            break;
                        }
                    }
                }
                else
                    item.Visible = true;
            }
        }

        private void FrmModel_Click(object sender, EventArgs e)
        {
            if (controlsColor == null)
                return;
            FrmModel_Enter(sender, e);
            this.Focus();
        }

        private void FrmModel_ControlAdded(object sender, ControlEventArgs e)
        {
            if (e.Control is Label)
                e.Control.Click += FrmModel_Click;
        }
    }
}
