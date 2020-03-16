namespace _05省市区联动
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.cboPro = new System.Windows.Forms.ComboBox();
            this.cobCity = new System.Windows.Forms.ComboBox();
            this.cobdis = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // cboPro
            // 
            this.cboPro.FormattingEnabled = true;
            this.cboPro.Location = new System.Drawing.Point(40, 38);
            this.cboPro.Name = "cboPro";
            this.cboPro.Size = new System.Drawing.Size(121, 20);
            this.cboPro.TabIndex = 0;
            this.cboPro.SelectedIndexChanged += new System.EventHandler(this.CboPro_SelectedIndexChanged);
            // 
            // cobCity
            // 
            this.cobCity.FormattingEnabled = true;
            this.cobCity.Location = new System.Drawing.Point(167, 38);
            this.cobCity.Name = "cobCity";
            this.cobCity.Size = new System.Drawing.Size(121, 20);
            this.cobCity.TabIndex = 1;
            this.cobCity.SelectedIndexChanged += new System.EventHandler(this.CobCity_SelectedIndexChanged);
            // 
            // cobdis
            // 
            this.cobdis.FormattingEnabled = true;
            this.cobdis.Location = new System.Drawing.Point(294, 38);
            this.cobdis.Name = "cobdis";
            this.cobdis.Size = new System.Drawing.Size(121, 20);
            this.cobdis.TabIndex = 2;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(459, 265);
            this.Controls.Add(this.cobdis);
            this.Controls.Add(this.cobCity);
            this.Controls.Add(this.cboPro);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cboPro;
        private System.Windows.Forms.ComboBox cobCity;
        private System.Windows.Forms.ComboBox cobdis;
    }
}

