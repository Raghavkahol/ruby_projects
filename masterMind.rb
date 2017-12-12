puts "Enter 1 to create code and 2 to break code"
choice=gets.chomp.to_i

option=['R','Y','B','C','M','G']
puts "Valid Options are #{option}"

code=[]
guess=[]
result=['!','!','!','!']


#code create by computer
def AutoCreation(code,option)
	for i in 0..3 do
		indexOption=rand(0..5)
		code[i]=option[indexOption]
	end
	return code
end


#break code by user
def AutoBreak(code,option,result,guess)
		12.times do
			cd=[]
			for i in 0..3
				cd[i]=code[i]
			end
			check=[0,0,0,0]
			for i in 0..3 
				if result[i]!='$' 
					if result[i]=='!'
						indexOption=rand(0..5)
						if option[indexOption]!=-1
							guess[i]=option[indexOption]
						elsif option[indexOption]==-1
							while option[indexOption]==-1 do
								indexOption=(indexOption+1)%6
							end
						end
							guess[i]=option[indexOption]
					
					elsif result[i]=='?'
						for j in 0..3
							if((result[j]=='?')&&j!=i&&(check[j]==0&&check[i]==0))
								guess[i],guess[j]=guess[j],guess[i]
								check[j]=1
								check[i]=1
							end
						end
						for j in 0..3
							if((result[j]=='!'))
								guess[j]=guess[i]
							end
						end
				end
				end
			end
			print guess
			puts ""
			
			#change the result array 
			for x in 0..3
				z=0
				for y in 0..3
					if guess[x]==cd[y]&&x==y
						result[x]='$'
						cd[y]='.'
						z=1
					end
				end
				for y in 0..3
					if guess[x]==cd[y]&&x!=y
						result[x]='?'
						cd[y]='.'
						z=1
					end
				end
				if (z==0)
					for w in 0..5
						if guess[x]==option[w]
							option[w]=-1
						end
					end
					result[x]='!'
				end
			end
			print result
			puts ""
			if(result[0]=='$'&&result[1]=='$'&&result[2]=='$'&&result[3]=='$')
			puts "You win and code is #{guess}"
			return
		end
		end	
	end		

#code creation by user
def createCode(code)
	puts "Enter code"
	code=gets.chomp
	return code
end

#break code by user
def BreakCode(code,option,result,guess)
	
	12.times do
		cd=[]
			for i in 0..3
				cd[i]=code[i]
			end
		puts "Enter your guess"
		guess=gets.chomp
		for i in 0..3 
		z=0
			for j in 0..3
				if guess[i]==cd[j]&&i==j
					result[i]='$'
					cd[j]='.'
					z=1
					break
				elsif guess[i]==cd[j]&&i!=j
					result[i]='?'
					cd[j]='.'
					z=1
					break
				end
			end
				if(z==0)
					result[i]='!'
				end
		end
		if(result[0]=='$'&&result[1]=='$'&&result[2]=='$'&&result[3]=='$')
			puts "You win and code is #{guess}"
			return
		end
		print result
		puts ""
	end
	puts "Code was #{code}"
end

#functions called from here on basis of entered choice
if (choice==1) 
	code=createCode(code)
	AutoBreak(code,option,result,guess) 
elsif (choice == 2)
    code=AutoCreation(code,option)
	BreakCode(code,option,result,guess)
end 

