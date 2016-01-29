using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using Kairos.DAO;
using System.Text;
using System.Windows.Forms;
using Kairos.Util;

namespace Kairos.View
{
    public partial class UcTurno : UcModel
    {
        List<Turno> _turnos;

        public UcTurno()
        {
            InitializeComponent();
            
        }

        private void UcTurno_Load(object sender, EventArgs e)
        {
            if (DesignMode)
                return;

            _turnos = Turno.get();
            cmbTurno.DataSource = null;
            lbxHorarios.DataSource = new List<HorariosTurno>();

            cmbTurno.DataSource = _turnos;
        }

        private void cmbTurno_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbTurno.SelectedItem != null)
            {
                lbxHorarios.DataSource = ((Turno)cmbTurno.SelectedItem).horarios;
            }
        }

        private void cmbTurno_TextChanged(object sender, EventArgs e)
        {
            lbxHorarios.DataSource = new List<HorariosTurno>();
        }

        private void btnDelHora_Click(object sender, EventArgs e)
        {
            if (lbxHorarios.DataSource == null)
                return;
            List<HorariosTurno> horarios = (List<HorariosTurno>)lbxHorarios.DataSource;
            if (horarios.Count == 0)
                return;

            HorariosTurno horario = (HorariosTurno)lbxHorarios.SelectedItem;
            if (horario == null)
                return;

            horario.delete();
            int index = lbxHorarios.SelectedIndex;
            horarios.RemoveAt(index);
            lbxHorarios.RefreshData();

            if (horarios.Count == 0 && cmbTurno.SelectedItem != null)
                ((Turno)cmbTurno.SelectedItem).delete();
        }

        private void btnAddHora_Click(object sender, EventArgs e)
        {
            if (cmbTurno.Text.Trim() == "")
                return;

            Turno turno = salvarTurno();

            HorariosTurno horario = new HorariosTurno();
            horario.horaInicial = tmInicial.Value;
            horario.horaFinal = tmFinal.Value;
            horario.turno = turno;
            horario.insert();

            List<HorariosTurno> horarios = (List<HorariosTurno>)lbxHorarios.DataSource;
            horarios.Add(horario);
            horarios.Sort();
            lbxHorarios.RefreshData();
            lbxHorarios.SelectedItem = horario;
        }

        private Turno salvarTurno()
        {
            Turno turno = null;
            List<HorariosTurno> horarios = (List<HorariosTurno>)lbxHorarios.DataSource;

            if (horarios.Count == 0)
            {
                foreach (Turno item in _turnos)
                {
                    if (item.nome.ToUpper() == cmbTurno.Text.ToUpper())
                    {
                        turno = item;
                        break;
                    }
                }
                if (turno == null)
                {
                    turno = new Turno();
                    turno.nome = cmbTurno.Text;
                    turno.horarios = horarios;
                    turno.insert();
                    _turnos.Add(turno);
                    cmbTurno.RefreshData();
                }
                cmbTurno.SelectedItem = turno;
            }
            else
                turno = ((Turno)cmbTurno.SelectedItem);

            return turno;
        }

        private void btnDelTurno_Click(object sender, EventArgs e)
        {
            Turno turno = cmbTurno.SelectedItem as Turno;

            if (turno != null)
            {
                turno.delete();
                UcTurno_Load(sender, e);
            }
        }
    }
}
