package com.glaf.base.utils;

import java.io.File;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.StringUtils;

/**
 * <p>
 * Title: StringUtil.java
 * </p>
 * <p>
 * Description: �ַ�����������
 * </p>
 */

public class StringUtil {
	private static Object initLock = new Object();

	private static Random randGen = null;

	private static char[] numbersAndLetters = null;

	static {
		// ��ʼ���������������
		if (randGen == null) {
			synchronized (initLock) {
				randGen = new Random();
				// ��ʼ�����֡���ĸ����
				numbersAndLetters = ("0123456789").toCharArray();
			}
		}
	}

	/**
	 * ��������ַ���
	 * 
	 * @param length
	 *            ����
	 * @return String ����ַ���
	 */
	public static final String randomNumString(int length) {
		if (length < 1) {
			return null;
		}

		// �����ַ���������װ����ĸ������
		char[] randBuffer = new char[length];
		for (int i = 0; i < randBuffer.length; i++) {
			randBuffer[i] = numbersAndLetters[randGen.nextInt(9)];
		}
		return new String(randBuffer);
	}

	/**
	 * �滻�ַ���
	 * 
	 * @param line
	 *            String ���봮
	 * @param oldString
	 *            String ���滻�Ĵ�
	 * @param newString
	 *            String Ҫ�滻�Ĵ�
	 * @return String �滻����ַ���
	 */
	public static final String replace(String line, String oldString,
			String newString) {
		if (line == null) {
			return null;
		}
		int i = 0;
		if ((i = line.indexOf(oldString, i)) >= 0) {
			char[] line2 = line.toCharArray();
			char[] newString2 = newString.toCharArray();
			int oLength = oldString.length();
			StringBuffer buf = new StringBuffer(line2.length);
			buf.append(line2, 0, i).append(newString2);
			i += oLength;
			int j = i;
			while ((i = line.indexOf(oldString, i)) > 0) {
				buf.append(line2, j, i - j).append(newString2);
				i += oLength;
				j = i;
			}
			buf.append(line2, j, line2.length - j);
			return buf.toString();
		}
		return line;
	}

	/**
	 * У��һ���ַ����Ƿ��������
	 * 
	 * @param str
	 *            String
	 * @return boolean
	 */
	public static boolean isGB2312(String str) {
		char[] chars = str.toCharArray();
		boolean isGB2312 = false;

		for (int i = 0; i < chars.length; i++) {
			byte[] bytes = ("" + chars[i]).getBytes();
			if (bytes.length == 2) {
				int[] ints = new int[2];
				ints[0] = bytes[0] & 0xff;
				ints[1] = bytes[1] & 0xff;
				if (ints[0] >= 0x81 && ints[0] <= 0xFE && ints[1] >= 0x40
						&& ints[1] <= 0xFE) {
					isGB2312 = true;
					break;
				}
			}
		}
		return isGB2312;
	}

	/**
	 * �������Ŀ¼
	 * 
	 * @param root
	 * @return
	 */
	public static String createDir(String root) {
		String path = randomNumString(4);
		String slash = File.separator;
		String first = path.substring(0, 2);
		String second = path.substring(2, 4);
		File dir = new File(root + slash + first);
		if (!dir.isDirectory())
			dir.mkdir();
		dir = new File(root + slash + first + slash + second);
		if (!dir.isDirectory())
			dir.mkdir();
		return first + slash + second + slash;
	}

	/**
	 * * ȡ�ַ�����ǰtoCount���ַ�
	 * 
	 * @param str
	 * @param toCount
	 * @return
	 */
	public static String substring(String str, int toCount) {
		int reInt = 0;
		String reStr = "";
		if (str == null) {
			return "";
		}
		char[] tempChar = str.toCharArray();
		for (int kk = 0; (kk < tempChar.length && toCount > reInt); kk++) {
			String s1 = String.valueOf(tempChar[kk]);
			byte[] b = s1.getBytes();
			reInt += b.length;
			reStr += tempChar[kk];
		}
		if (toCount == reInt || (toCount == reInt - 1)) {
			reStr += "...";
		}
		return reStr;
	}

	/**
	 * if input is a single-dimension primitive array, return a new array
	 * consisting of wrapped elements, else just return input argument
	 */
	public static Object toArray(Object vec) {
		// if null, return
		if (vec == null) {
			return vec;
		}

		// if not an array or elements not primitive, return
		Class clasz = vec.getClass();
		if (!clasz.isArray()) {
			return vec;
		}
		if (!clasz.getComponentType().isPrimitive()) {
			return vec;
		}

		// get array length and create Object output array
		int length = Array.getLength(vec);
		Object newvec[] = new Object[length];

		// wrap and copy elements
		for (int i = 0; i < length; i++) {
			newvec[i] = Array.get(vec, i);
		}
		return newvec;
	}

	/**
	 * ת����List����
	 * 
	 * @param vec
	 * @return
	 */
	public static List toList(Object[] vec) {
		List list = Arrays.asList(vec);
		return list;
	}

	/**
	 * String[] ����ת��Ϊ String ���� �÷ָ���ֿ�
	 * 
	 * @param vec
	 * @return
	 */
	public static String toString(String[] vec, String delima) {
		String retStr = "";
		String defaultDelima = ",";
		if (delima != null && !"".equals(delima)) {
			defaultDelima = delima;
		}
		if (vec != null) {
			for (int i = 0; i < vec.length; i++) {
				retStr += vec[i].trim() + defaultDelima;
			}
			retStr = retStr.endsWith(defaultDelima) ? retStr.substring(0,
					retStr.length() - 1) : retStr;
		}
		return retStr;
	}

	public static String toString(String[] vec) {
		return toString(vec, null);
	}

	/**
	 * String ����ת��Ϊ String[] ����
	 * 
	 * @param vec
	 * @return
	 */
	public static String[] stringTo(String vec, String delima) {
		String[] retStr = null;
		String defaultDelima = ",";
		if (delima != null && !"".equals(delima)) {
			defaultDelima = delima;
		}
		if (vec != null && !"".equals(vec)) {
			retStr = vec.split(defaultDelima);
		}
		return retStr;
	}

	public static String[] stringTo(String vec) {
		return stringTo(vec, null);
	}

	/**
	 * ��ʽ������
	 * 
	 * @param number
	 *            ����
	 * @param pattern
	 *            ��ʽ
	 * @return
	 */
	public static String getFormatNumber(double number, String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(number);
	}

	/**
	 * ��ʽ��������֣�С��λ��������(�������Զ��ŷָ����ַ���)
	 * 
	 * @param number
	 *            double ����
	 * @param digit
	 *            int С��λ
	 * @return String
	 */
	public static String getFormatCurrency(double number, int digit) {
		String pattern = "#,##0";
		if (digit > 0) {
			pattern += ".";
			for (int i = 0; i < digit; i++) {
				pattern += "0";
			}
		}
		return getFormatNumber(number, pattern);
	}

	/**
	 * ��ʽ��������֣�С��λ��������(�������Զ��ŷָ����ַ���,����2λ��)
	 * 
	 * @param number
	 * @param digit
	 * @return
	 */
	public static String getFormatCurrency(double number) {
		return getFormatCurrency(number, 2);
	}

	/**
	 * ��ʽ��������֣�С��λ��������(�������ŷָ����ַ���)
	 * 
	 * @param number
	 *            double ����
	 * @param digit
	 *            int С��λ
	 * @return String
	 */
	public static String getFormatCurrencyNumber(double number, int digit) {
		String pattern = "###0";
		if (digit > 0) {
			pattern += ".";
			for (int i = 0; i < digit; i++) {
				pattern += "0";
			}
		}
		return getFormatNumber(number, pattern);
	}

	/**
	 * ��ʽ��������֣�С��λ��������(�������ŷָ����ַ���,����2λ��)
	 * 
	 * @param number
	 * @param digit
	 * @return
	 */
	public static String getFormatCurrencyNumber(double number) {
		return getFormatCurrencyNumber(number, 2);
	}

	/**
	 * ��ʽ�����������pattern �õ�����Ҫ�ĸ�ʽ
	 * 
	 * @param number
	 * @param digit
	 * @param pattern
	 * @return
	 */
	public static String getFormatCurrency(double number, String pattern) {
		return getFormatNumber(number, pattern);
	}

	/**
	 * ��ʽ���ٷֱ�(����С����2λ)
	 * 
	 * @param number
	 *            double ����
	 * @return
	 */
	public static String getFormatPercent(double number) {
		return getFormatPercent(number, 2);
	}

	/**
	 * ��ʽ���ٷֱ�
	 * 
	 * @param number
	 *            double ����
	 * @param digit
	 *            int С��λ
	 * @return
	 */
	public static String getFormatPercent(double number, int digit) {
		String pattern = "0";
		if (digit > 0) {
			pattern += ".";
			for (int i = 0; i < digit; i++) {
				pattern += "0";
			}
		}
		pattern += "%";
		return getFormatNumber(number, pattern);
	}

	/**
	 * ��ʽ���ٷֱ�(����%)
	 * 
	 * @param number
	 * @param digit
	 * @return
	 */
	public static String getFormatPercentNumber(double number, int digit) {
		String pattern = "###0";
		if (digit > 0) {
			pattern += ".";
			for (int i = 0; i < digit; i++) {
				pattern += "0";
			}
		}
		return getFormatNumber(number * 100d, pattern);
	}

	/**
	 * ��ʽ���ٷֱ�(����%)
	 * 
	 * @param number
	 * @return
	 */
	public static String getFormatPercentNumber(double number) {
		return getFormatPercentNumber(number, 2);
	}

	/**
	 * �ж��Ƿ���С��
	 * 
	 * @param num
	 * @return
	 */
	public static boolean hasDigitNum(double num) {
		return num % 1.0 != 0.0;
	}

	/**
	 * ������ת��Ϊ����Ҵ�д
	 * 
	 */

	static char pp(char c) {
		switch (c) {
		case '1':
			return 'Ҽ';
		case '2':
			return '��';
		case '3':
			return '��';
		case '4':
			return '��';
		case '5':
			return '��';
		case '6':
			return '½';
		case '7':
			return '��';
		case '8':
			return '��';
		case '9':
			return '��';
		case '0':
			return '��';
		}
		return c;
	}

	public static StringBuffer ZhuanHuan(String iin) {
		String in = iin;

		boolean xb = false; // Ĭ��û��С��
		if (in.indexOf(".") != -1) {
			xb = true;
		}

		// �����С����ͽ��䰴С����ָ�,���ֱ����s1��s2��
		StringBuffer out = new StringBuffer("");
		String s1 = new String("");
		String s2 = new String("");
		if (in.indexOf('.') != -1) {
			in = in.replace('.', '#');
			String[] s = in.split("#");
			s1 = s[0];
			s2 = s[1];
		} else {
			s1 = in;
		}

		// ���С������ߵ���
		if (s1.length() >= 9) { // ��
			// System.out.println("������");
			String yi = s1.substring(0, s1.length() - 8);
			String wan = s1.substring(s1.length() - 8, s1.length() - 4);
			String qian = s1.substring(s1.length() - 4, s1.length());

			int len = yi.length();
			boolean b = true;

			// ����������
			for (int i = 0; i < yi.length(); i++) {
				if (len == 4) {
					out.append(pp(yi.charAt(i)));
					out.append(" Ǫ ");
					len--;
				} else if (len == 3) {
					/*
					 * if (yi.charAt(i) == '0' ) { b = false ; out.append( " �� "
					 * ); len -- ; continue ; } else {
					 */
					out.append(pp(yi.charAt(i)));
					out.append(" �� ");
					len--;
					continue;
					// }
				} else if (len == 2) {
					/*
					 * if (yi.charAt(i) == '0' && ! b) { len -- ; continue ; }
					 * if (yi.charAt(i) == '0' && b) { b = false ; out.append( "
					 * �� " ); len -- ; continue ; } else {
					 */
					out.append(pp(yi.charAt(i)));
					out.append(" ʰ ");
					len--;
					continue;
					// }
				} else if (len == 1) {
					/*
					 * if (yi.charAt(i) == '0' ) { out.append( " �� " ); len -- ;
					 * continue ; } else {
					 */
					out.append(pp(yi.charAt(i)));
					out.append(" �� ");
					len--;
					// }
				}
			}
			/*
			 * if (out.charAt(out.indexOf( " �� " ) - 1 ) == '��' ) {
			 * out.deleteCharAt(out.indexOf( " �� " ) - 1 ); out.append( " �� " );
			 * } if (yi.charAt(yi.length() - 1 ) == '0' ) { out.append( " �� " );
			 * }
			 * 
			 * if (out.charAt(out.length() - 2 ) == out.charAt(out.length() - 1
			 * )) { // ɾ����������� out.deleteCharAt(out.lastIndexOf( " �� " )); }
			 */
			// ����������
			len = wan.length();
			b = true;
			if (wan.charAt(0) == '0' && wan.charAt(1) == '0'
					&& wan.charAt(2) == '0' && wan.charAt(3) == '0' && false) {
				// ���������ȫΪ0��ʲôҲ����
			} else {
				for (int i = 0; i < wan.length(); i++) {
					if (len == 4) {
						/*
						 * if (wan.charAt(i) == '0' ) { out.append( " �� " ); len
						 * -- ; continue ; }
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" Ǫ ");
						len--;
						continue;
					} else if (len == 3) {
						/*
						 * if (wan.charAt(i) == '0' ) { b = false ; out.append(
						 * " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					} else if (len == 2) {
						/*
						 * if (wan.charAt(i) == '0' && ! b) { len -- ; continue
						 * ; } if (wan.charAt(i) == '0' && b) { b = false ;
						 * out.append( " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" ʰ ");
						len--;
						continue;
						// }
					} else if (len == 1) {
						/*
						 * if (wan.charAt(i) == '0' ) { out.append( " �� " ); len
						 * -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					}
				}
				/*
				 * if (out.charAt(out.indexOf( " �� " ) - 1 ) == '��' ) {
				 * out.deleteCharAt(out.indexOf( " �� " ) - 1 ); out.append(
				 * " �� " ); } if (wan.charAt(wan.length() - 1 ) == '0' ) {
				 * out.append( " �� " ); } if (out.charAt(out.length() - 2 ) ==
				 * out .charAt(out.length() - 1 )) {
				 * out.deleteCharAt(out.lastIndexOf( " �� " )); }
				 */
			}

			// ǧ����
			len = qian.length();
			b = true;
			if (qian.charAt(0) == '0' && qian.charAt(1) == '0'
					&& qian.charAt(2) == '0' && qian.charAt(3) == '0' && false) {
				// ���ǧ����ȫΪ0��ʲôҲ����
			} else {
				for (int i = 0; i < qian.length(); i++) {
					if (len == 4) {
						/*
						 * if (qian.charAt(i) == '0' ) { out.append( " �� " );
						 * len -- ; continue ; }
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" Ǫ ");
						len--;
						continue;
					} else if (len == 3) {
						/*
						 * if (qian.charAt(i) == '0' ) { b = false ; out.append(
						 * " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					} else if (len == 2) {
						/*
						 * if (qian.charAt(i) == '0' && ! b) { len -- ; continue
						 * ; } if (qian.charAt(i) == '0' && b) { b = false ;
						 * out.append( " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" ʰ ");
						len--;
						continue;
						// }
					} else if (len == 1) {
						/*
						 * if (qian.charAt(i) == '0' ) { out.append( " Ԫ " );
						 * len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" Ԫ ");
						len--;
						continue;
						// }
					}
				}
			}
			/*
			 * if (out.charAt(out.length() - 2 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 2 ); }
			 * 
			 * if (out.charAt(out.length() - 1 ) == '��' ) { // ɾ��������� while
			 * (out.charAt(out.length() - 1 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 1 ); } out.append( " Ԫ " ); } for
			 * ( int i = out.length() - 1 ; i >= 0 ; i -- ) { // ɾ��������� if
			 * (out.indexOf( " �� " ) !=- 1 ) { if (out.charAt(out.lastIndexOf( "
			 * �� " ) - 1 ) == '��' ) { out.deleteCharAt(out.lastIndexOf( " �� " )
			 * - 1 ); } } }
			 */

			// ����С��
			if (xb) {
				int llen = s2.length();
				if (llen >= 2) {
					/*
					 * if (s2.charAt( 0 ) == '0' && s2.charAt( 1 ) == '0' ) { //
					 * С��Ϊ����0��ʲôҲ���� } else if (s2.charAt( 1 ) == '0' ) {
					 * out.append( pp(s2.charAt( 0 ))); out.append( " �� " ); }
					 * else if (s2.charAt( 0 ) == '0' ) { out.append( " �� " );
					 * out.append( pp(s2.charAt( 1 ))); out.append( " �� " ); }
					 * else {
					 */
					out.append(pp(s2.charAt(0)));
					out.append(" �� ");
					out.append(pp(s2.charAt(1)));
					out.append(" �� ");
					// }
				}
				if (llen == 1) {
					if (s2.charAt(0) == '0') {
						// С��Ϊ����0��ʲôҲ����
						/* } else { */
						out.append(pp(s2.charAt(0)));
						out.append(" �� ");
					}
				}
				return out;
			} else {
				return out;
			}

		} else if (s1.length() >= 5) { // ��
			// System.out.println("������");
			String wan = s1.substring(0, s1.length() - 4);
			String qian = s1.substring(s1.length() - 4, s1.length());
			// ����������
			int len = wan.length();
			boolean b = true;
			if (wan.charAt(0) == '0' && wan.charAt(1) == '0'
					&& wan.charAt(2) == '0' && wan.charAt(3) == '0' && false) {
				// ���������ȫΪ0��ʲôҲ����
			} else {
				for (int i = 0; i < wan.length(); i++) {
					if (len == 4) {
						out.append(pp(wan.charAt(i)));
						out.append(" Ǫ ");
						len--;
					} else if (len == 3) {
						/*
						 * if (wan.charAt(i) == '0' ) { b = false ; out.append(
						 * " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					} else if (len == 2) {
						/*
						 * if (wan.charAt(i) == '0' && ! b) { len -- ; continue
						 * ; } if (wan.charAt(i) == '0' && b) { b = false ;
						 * out.append( " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" ʰ ");
						len--;
						continue;
						// }
					} else if (len == 1) {
						/*
						 * if (wan.charAt(i) == '0' ) { out.append( " �� " ); len
						 * -- ; continue ; } else {
						 */
						out.append(pp(wan.charAt(i)));
						out.append(" �� ");
						len--;
						// }
					}
				}
				/*
				 * if (out.charAt(out.indexOf( " �� " ) - 1 ) == '��' ) {
				 * out.deleteCharAt(out.indexOf( " �� " ) - 1 ); out.append(
				 * " �� " ); } if (wan.charAt(wan.length() - 1 ) == '0' ) {
				 * out.append( " �� " ); } if (out.charAt(out.length() - 2 ) ==
				 * out .charAt(out.length() - 1 )) {
				 * out.deleteCharAt(out.lastIndexOf( " �� " )); }
				 */
			}

			// ǧ����
			len = qian.length();
			b = true;
			if (qian.charAt(0) == '0' && qian.charAt(1) == '0'
					&& qian.charAt(2) == '0' && qian.charAt(3) == '0' && false) {
				// ���ǧ����ȫΪ0��ʲôҲ����
			} else {
				for (int i = 0; i < qian.length(); i++) {
					if (len == 4) {
						/*
						 * if (qian.charAt(i) == '0' && out.charAt(out.length()
						 * - 1 ) != '��' ) { out.append( " �� " ); len -- ;
						 * continue ; } else if (qian.charAt(i) == '0' &&
						 * out.charAt(out.length() - 1 ) == '��' ) { len -- ;
						 * continue ; }
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" Ǫ ");
						len--;
					} else if (len == 3) {
						/*
						 * if (qian.charAt(i) == '0' ) { b = false ; out.append(
						 * " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					} else if (len == 2) {
						/*
						 * if (qian.charAt(i) == '0' && ! b) { len -- ; continue
						 * ; } if (qian.charAt(i) == '0' && b) { b = false ;
						 * out.append( " �� " ); len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" ʰ ");
						len--;
						continue;
						// }
					} else if (len == 1) {
						/*
						 * if (qian.charAt(i) == '0' ) { out.append( " Ԫ " );
						 * len -- ; continue ; } else {
						 */
						out.append(pp(qian.charAt(i)));
						out.append(" Ԫ ");
						len--;
						// }
					}
				}
			}
			/*
			 * if (out.charAt(out.length() - 2 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 2 ); } if
			 * (out.charAt(out.length() - 1 ) == '��' ) { // ɾ��������� while
			 * (out.charAt(out.length() - 1 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 1 ); } out.append( " Ԫ " ); } for
			 * ( int i = out.length() - 1 ; i >= 0 ; i -- ) { // ɾ��������� if
			 * (out.indexOf( " �� " ) !=- 1 ) { if (out.charAt(out.lastIndexOf( "
			 * �� " ) - 1 ) == '��' ) { out.deleteCharAt(out.lastIndexOf( " �� " )
			 * - 1 ); } } }
			 */

			// ����С�����ұߵ���
			if (xb) {
				int llen = s2.length();
				if (llen >= 2) {
					/*
					 * if (s2.charAt( 0 ) == '0' && s2.charAt( 1 ) == '0' ) { //
					 * С��Ϊ����0��ʲôҲ���� } else if (s2.charAt( 1 ) == '0' ) {
					 * out.append( pp(s2.charAt( 0 ))); out.append( " �� " ); }
					 * else if (s2.charAt( 0 ) == '0' ) { out.append( " �� " );
					 * out.append( pp(s2.charAt( 1 ))); out.append( " �� " ); }
					 * else {
					 */
					out.append(pp(s2.charAt(0)));
					out.append(" �� ");
					out.append(pp(s2.charAt(1)));
					out.append(" �� ");
					// }
				}
				if (llen == 1) {
					if (s2.charAt(0) == '0') {
						// С��Ϊ����0��ʲôҲ����
					} else {
						out.append(pp(s2.charAt(0)));
						out.append(" �� ");
					}
				}
				return out;
			} else {
				return out;
			}

		} else { // ǧ
			// System.out.println("ǧ����");
			String qian = s1;
			// ǧ����
			int len = qian.length();
			boolean b = true;
			if (qian.charAt(0) == '0' && len == 1) {
				out.append(pp(qian.charAt(0)) + " Ԫ ");
			} else if (qian.charAt(0) == '0' && qian.charAt(1) == '0'
					&& qian.charAt(2) == '0' && qian.charAt(3) == '0') {

				out.append(pp(qian.charAt(0)) + " Ԫ ");
				// ���ǧ����ȫΪ0��ʲôҲ����
			} else {
				for (int i = 0; i < qian.length(); i++) {
					if (len == 4) {
						out.append(pp(qian.charAt(i)));
						out.append(" Ǫ ");
						len--;
					} else if (len == 3) {
						// if (qian.charAt(i) == '0' ) {
						// b = false ;
						// out.append( " �� " );
						// out.append( " ʰ " );
						// len -- ;
						// continue ;
						// } else {
						out.append(pp(qian.charAt(i)));
						out.append(" �� ");
						len--;
						continue;
						// }
					} else if (len == 2) {
						// if (qian.charAt(i) == '0' && ! b) {
						// len -- ;
						// continue ;
						// }
						// if (qian.charAt(i) == '0' && b) {
						// b = false ;
						// out.append( pp(qian.charAt(i)));
						// out.append( " ʰ " );
						// len -- ;
						// continue ;
						// } else {
						out.append(pp(qian.charAt(i)));
						out.append(" ʰ ");
						len--;
						continue;
						// }
					} else if (len == 1) {
						// if (qian.charAt(i) == '0' ) {
						// out.append( " Ԫ " );
						// len -- ;
						// continue ;
						// } else {
						out.append(pp(qian.charAt(i)));
						out.append(" Ԫ ");
						len--;
						// }
					}
				}
			}
			/*
			 * if (out.charAt(out.length() - 2 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 2 ); }
			 * 
			 * if (out.charAt(out.length() - 1 ) == '��' ) { // ɾ��������� while
			 * (out.charAt(out.length() - 1 ) == '��' ) {
			 * out.deleteCharAt(out.length() - 1 ); } out.append( " Ԫ " ); }
			 */

			// ����С�����ұߵ���
			if (xb) {
				int llen = s2.length();
				if (llen >= 2) {
					/*
					 * if (s2.charAt( 0 ) == '0' && s2.charAt( 1 ) == '0' ) { //
					 * С��Ϊ����0��ʲôҲ���� } else if (s2.charAt( 1 ) == '0' ) {
					 * out.append( pp(s2.charAt( 0 ))); out.append( " �� " ); }
					 * else if (s2.charAt( 0 ) == '0' ) { out.append( " �� " );
					 * out.append( pp(s2.charAt( 1 ))); out.append( " �� " ); }
					 * else {
					 */
					out.append(pp(s2.charAt(0)));
					out.append(" �� ");
					out.append(pp(s2.charAt(1)));
					out.append(" �� ");
					// }
				}
				if (llen == 1) {
					if (s2.charAt(0) == '0') {
						// С��Ϊ����0��ʲôҲ����
					} else {
						out.append(pp(s2.charAt(0)));
						out.append(" �� ");
					}
				}
				return out;
			} else {
				return out;
			}
		}
	}

	/**
	 * ת����HTML����
	 * 
	 * @param s
	 * @return
	 */
	public static String encodeHtml(String s) {
		if (s == null) {
			return "";
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c == '<') {
				sb.append("&lt;");
			} else if (c == '>') {
				sb.append("&gt;");
			} else if (c == '"') {
				sb.append("&quot;");
			} else if (c == '\n') {
				sb.append("<br />");
			} else {
				sb.append(c);
			}
		}
		return StringUtils.replace(sb.toString(), "  ", "&nbsp;");
	}

	/**
	 * ���ַ���ת����int����
	 * 
	 * @param str
	 * @return
	 */
	public static int[] toIntArray(String str) {
		if (str == null) {
			return null;
		}
		String[] s = StringUtils.split(str, ",");
		int[] r = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			r[i] = Integer.parseInt(s[i]);
		}
		return r;
	}

	/**
	 * ȡ���һ����ĸ����һ����ĸ author:key createDate:2010-9-19
	 * 
	 * @param str
	 * @return
	 */
	public static char getLastChar(String str) {
		if (str == null || str.length() <= 0) {
			return 'A';
		}
		char s = (char) (str.charAt(str.length() - 1) + 1);
		return s;
	}

	public static String getContent(String s) {
		if (s == null)
			return "";

		s = s.replaceAll("&ensp;", " ");
		s = s.replaceAll("&nbsp;", " ");
		s = s.replaceAll("&emsp;", "��");
		s = s.replaceAll("&lt;", "<");
		s = s.replaceAll("&gt;", ">");
		s = s.replaceAll("&ldquo;", "��");
		s = s.replaceAll("&rdquo;", "��");
		s = s.replaceAll("&quot;", "��");
		s = s.replaceAll("&rsquo;", "��");
		s = s.replaceAll("&lsquo;", "��");
		s = s.replaceAll("&mdash;", "��");
		s = s.replaceAll("&ndash;", "�C");
		s = s.replaceAll("&middot;", "��");
		s = s.replaceAll("&hellip;", "��");
		s = s.replaceAll("<br>", "\r\n");
		s = s.replaceAll("<br/>", "\r\n");
		s = s.replaceAll("<br />", "\r\n");
		s = s.replaceAll("  ", "��");
		s = s.replaceAll("&amp;", "&");

		return s;
	}

	public static String getHtmlContent(String s) {
		if (s == null)
			return "";
		s = s.replaceAll("&", "&amp;");
		s = s.replaceAll("��", " ");
		s = s.replaceAll("��", "&hellip;");
		s = s.replaceAll("<", "&lt;");
		s = s.replaceAll(">", "&gt;");
		s = s.replaceAll("\r\n", "<br>");
		s = s.replaceAll("\r\n", "<br/>");
		s = s.replaceAll("\r\n", "<br />");
		s = s.replaceAll("��", "&ldquo;");
		s = s.replaceAll("��", "&rdquo;");
		s = s.replaceAll("��", "&quot;");
		s = s.replaceAll("��", "&rsquo;");
		s = s.replaceAll("��", "&lsquo;");
		s = s.replaceAll("��", "&mdash;");
		s = s.replaceAll("�C", "&ndash;");
		s = s.replaceAll("��", "&middot;");

		return s;
	}

	public static void main(String[] args) {
		double d = 21322.1;
		System.out.println(getFormatCurrency(d, 2));
		System.out.println(hasDigitNum(d));

		System.out.println(getFormatPercent(0.50426, 2));
		System.out.println(getFormatPercent(0.501));
		System.out.println(getFormatPercentNumber(0.50));

		System.out.println(getFormatCurrency(d));
		System.out.println(getFormatCurrencyNumber(d));

		System.out.println(encodeHtml("1122\n 3  3534 <@@#>"));
	}
}