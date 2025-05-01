
package resume;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.showMessageDialog;
import java.sql.ResultSet;


public class login extends javax.swing.JFrame {

    public login() {
        initComponents();
    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        email = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        password = new javax.swing.JPasswordField();
        login = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Login");
        setPreferredSize(new java.awt.Dimension(600, 400));

        jPanel1.setBackground(new java.awt.Color(204, 204, 255));
        jPanel1.setPreferredSize(new java.awt.Dimension(700, 400));
        jPanel1.setLayout(null);

        jLabel1.setFont(new java.awt.Font("Baskerville Old Face", 0, 36)); // NOI18N
        jLabel1.setText("Login");
        jPanel1.add(jLabel1);
        jLabel1.setBounds(240, 0, 100, 80);

        jLabel2.setFont(new java.awt.Font("Bookman Old Style", 0, 20)); // NOI18N
        jLabel2.setText("Email:");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(80, 100, 90, 22);

        email.setFont(new java.awt.Font("Bookman Old Style", 0, 12)); // NOI18N
        email.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                emailActionPerformed(evt);
            }
        });
        jPanel1.add(email);
        email.setBounds(160, 90, 310, 40);

        jLabel3.setFont(new java.awt.Font("Bookman Old Style", 0, 20)); // NOI18N
        jLabel3.setText("Password:");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(40, 180, 120, 24);

        password.setFont(new java.awt.Font("Baskerville Old Face", 0, 14)); // NOI18N
        password.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                passwordActionPerformed(evt);
            }
        });
        jPanel1.add(password);
        password.setBounds(160, 170, 310, 40);

        login.setFont(new java.awt.Font("Bookman Old Style", 0, 24)); // NOI18N
        login.setText("Login");
        login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                loginActionPerformed(evt);
            }
        });
        jPanel1.add(login);
        login.setBounds(170, 250, 100, 36);

        jLabel4.setFont(new java.awt.Font("Bookman Old Style", 0, 14)); // NOI18N
        jLabel4.setText("Don't have an account?");
        jPanel1.add(jLabel4);
        jLabel4.setBounds(170, 310, 180, 30);

        jButton2.setFont(new java.awt.Font("Bookman Old Style", 0, 12)); // NOI18N
        jButton2.setText("Sign up");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2);
        jButton2.setBounds(350, 310, 90, 30);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 601, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>                        

    private void emailActionPerformed(java.awt.event.ActionEvent evt) {                                      
        // TODO add your handling code here:
    }                                     

    private void passwordActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // TODO add your handling code here:
    }                                        

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        signup signupFrame=new signup();
        signupFrame.setVisible(true);
        signupFrame.pack();
        signupFrame.setLocationRelativeTo(null);
        this.dispose();
    }                                        

    private void loginActionPerformed(java.awt.event.ActionEvent evt) {                                      
        String Email,Password,query,passDb=null;
        String SUrl,SUser,Spass;
        SUrl= "jdbc:mysql://localhost:3306/login";
        SUser="root";
        Spass="ROOT";
        int notFound =0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con =DriverManager.getConnection(SUrl,SUser,Spass);
            Statement st=con.createStatement();
            if("".equals(email.getText())){
                JOptionPane.showMessageDialog(new JFrame(),"Email is Require", "error",JOptioPane.ERROR_MESSAGE);
            }else if("".equals(password.getText())){
                JOptionPane.showMessageDialog(new JFrame(),"Password is Require", "error",JOptioPane.ERROR_MESSAGE);
        }else{
              Email=email.getText();
              Password = password.getText();
              query="select * from signup where email='"+Email+"'";
              ResultSet rs=st.executeQuery(query);
              while(rs.next()){
                  passDb =rs.getString("Password");
                  notFound=1;
              }
              if(notFound ==1 && Password.equals(passDb)){
                home homeFrame= new home();
                homeFrame.setVisible(true);
                homeFrame.pack();
                homeFrame.setLocationRelativeTo(null);
                this.dispose();
              }else{
                 JOptionPane.showMessageDialog(new JFrame(),"Incorrect email or password", "erroor",JOptioPane.ERROR_MESSAGE); 
              }
              password.setText("");
            }
        }catch(Exception e)
        {
          System.out.println("Error!"+e.getMessage());   
        }
    }                                     


    // Variables declaration - do not modify                     
    private javax.swing.JTextField email;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton login;
    private javax.swing.JPasswordField password;
    // End of variables declaration                   

    private static class JOptioPane {

        private static int ERROR_MESSAGE;

        public JOptioPane() {
        }
    }
}
