<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${mail.subject}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

    <table width="100%" style="font-family: Arial, sans-serif;border-collapse:collapse;" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center" style="color: #444444;font-size: 0.9em">Read this mail in your browser by clicking <a href="">here</a></td>
        </tr>
        <tr>
            <td>
                <table style="margin:auto;" width="800">
                    <tr>
                        <td background="../img/dark-map-background-mail.jpg" height="150" bgcolor="#7aadff" style="text-align:center;padding: 10px 10px 8px 5px;">
                            <img src="../img/ebusiness.png" width="400" />
                            <h2 style="color:white;margin:0;padding:0;">${mail.subject}</h2>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 15px;color: #222" bgcolor="#f3f3f3">
                            ${mail.content}
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#333333" height="70" cellpadding="10" style="padding: 10px;">
                            <table width="100%">
                                <tr>
                                    <td style="color: white;">
                                        <p style="font-size: 1.0em">
                                            Resourcepool &bull; 2017
                                        </p>

                                    </td>
                                    <td align="right">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>